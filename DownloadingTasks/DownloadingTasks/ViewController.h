//
//  ViewController.h
//  DownloadingTasks
//
//  Created by magic on 16/02/17.
//  Copyright © 2017 magic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLSessionDownloadDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageviewit;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *resumeButton;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

- (IBAction)cancel:(id)sender;
- (IBAction)resume:(id)sender;

@end

