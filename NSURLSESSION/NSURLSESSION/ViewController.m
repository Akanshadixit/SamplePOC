//
//  ViewController.m
//  NSURLSESSION
//
//  Created by magic on 20/12/16.
//  Copyright © 2016 magic. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSURL *URL = [NSURL URLWithString:@"http://www.google.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//    
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
//                                            completionHandler:
//                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
//                                      // ...
//                                      NSLog(@"vbjerbvbibribvinbrvnbrfvnbrfn");
//                                      [_audioWebView loadRequest:request];
//                                  }];
//    
//    [task resume];
    //[self stopAudioAndCloseAudioView:nil];
//    NSURL *URL = [NSURL URLWithString:@"http://WWW.google.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//    [_audioWebView loadRequest:request];
    
    NSURL *URL = [NSURL URLWithString:@"https://static.pexels.com/photos/4825/red-love-romantic-flowers.jpg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request
                                                            completionHandler:
                                              ^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                  NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
                                                  NSURL *documentsDirectoryURL = [NSURL fileURLWithPath:documentsPath];
                                                  NSURL *documentURL = [documentsDirectoryURL URLByAppendingPathComponent:[response
                                                                                                                           suggestedFilename]];
                                                  [[NSFileManager defaultManager] moveItemAtURL:location
                                                                                          toURL:documentURL
                                                                                          error:nil];
                                                  
                                                  NSData *dataReturned = [NSData dataWithContentsOfURL:location];
                                                  
                                                  [_audioButtonImage setImage:[UIImage imageWithData:dataReturned]];
                                              }];
    
    [downloadTask resume];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)stopAudioAndCloseAudioView:(id)aSender{
    NSURL *URL = [NSURL URLWithString:@"http://www.google.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [_audioWebView loadRequest:request];

}



@end
