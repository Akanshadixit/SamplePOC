//
//  ViewController.m
//  DownloadingTasks
//
//  Created by magic on 16/02/17.
//  Copyright © 2017 magic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDelegate, NSURLSessionDownloadDelegate> {
    NSURLSession *_session;
}

@property (strong, nonatomic) NSURLSessionDownloadTask *downloadTask;
@property (strong, nonatomic) NSData *resumeData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // [self downloadingTaskss];
    
    
    // Add Observer
    [self addObserver:self forKeyPath:@"resumeData" options:NSKeyValueObservingOptionNew context:NULL];
    [self addObserver:self forKeyPath:@"downloadTask" options:NSKeyValueObservingOptionNew context:NULL];
    
    // Setup User Interface
    [self.cancelButton setHidden:YES];
    [self.resumeButton setHidden:YES];
    
    // Create Download Task
    self.downloadTask = [self.session downloadTaskWithURL:[NSURL URLWithString:@"https://static.pexels.com/photos/4825/red-love-romantic-flowers.jpg"]];
    
    // Resume Download Task
    [self.downloadTask resume];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSURLSession *)session {
    if (!_session) {
        // Create Session Configuration
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        // Create Session
        _session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
    }
    
    return _session;
}

- (IBAction)cancel:(id)sender {
    if (!self.downloadTask) return;
    
    // Hide Cancel Button
    [self.cancelButton setHidden:YES];
    
    [self.downloadTask cancelByProducingResumeData:^(NSData *resumeData) {
        if (!resumeData)
            return;
        [self setResumeData:resumeData];
        [self setDownloadTask:nil];
    }];
}

- (IBAction)resume:(id)sender {
    if (!self.resumeData) return;
    
    // Hide Resume Button
    [self.resumeButton setHidden:YES];
    
    // Create Download Task
    self.downloadTask = [self.session downloadTaskWithResumeData:self.resumeData];
    
    // Resume Download Task
    [self.downloadTask resume];
    
    // Cleanup
    [self setResumeData:nil];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"resumeData"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.resumeButton setHidden:(self.resumeData == nil)];
        });
        
    } else if ([keyPath isEqualToString:@"downloadTask"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.cancelButton setHidden:(self.downloadTask == nil)];
        });
    }
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSData *data = [NSData dataWithContentsOfURL:location];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.cancelButton setHidden:YES];
        [self.progressView setHidden:YES];
        [self.imageviewit setImage:[UIImage imageWithData:data]];
    });
    
    // Invalidate Session
    [session finishTasksAndInvalidate];
}


















//-(void)downloadingTaskss{
//NSString *downloadFolderPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
//    
//    //NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/YourFile.txt"];
//   
//
////NSURL *URL = [NSURL URLWithString:@"https://static.pexels.com/photos/4825/red-love-romantic-flowers.jpg"];
//    
//    //NSURL *URL = [NSURL URLWithString:@"https://wetransfer.com/downloads/bf41508e200a091c8e553e4b25b5229520170216051723/aa3832"];
//    
////    NSURL *URL = [NSURL URLWithString:@"http://presidencycollege.edu.in/images/default/sample.pdf"];
//    
////    NSURL *URL = [NSURL URLWithString:@"https://owl.english.purdue.edu/media/pdf/20081113013048_544.pdf"];
////NSURL *URL = [NSURL URLWithString:@"http://www.sample-videos.com/audio/mp3/india-national-anthem.mp3"];
//   NSURL *URL = [NSURL URLWithString:@"http://dev.exiv2.org/attachments/379/DSCF8865.AVI"];
//    
//NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//NSURLSession *session = [NSURLSession sharedSession];
//NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request
//                                                        completionHandler:
//                                          ^(NSURL *location, NSURLResponse *response, NSError *error) {
//                                             
//                                              NSString *imagePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"/mp4video.AVI"];
//                                              
//
//                                              
//                                              NSData *dataReturned = [NSData dataWithContentsOfURL:location];
//                                              
//                                              [dataReturned writeToFile:imagePath atomically:YES];
//                                              
//                                          }];
//
//[downloadTask resume];
//  }


@end
