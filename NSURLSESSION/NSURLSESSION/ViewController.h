//
//  ViewController.h
//  NSURLSESSION
//
//  Created by magic on 20/12/16.
//  Copyright © 2016 magic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(strong,nonatomic)IBOutlet UIWebView *audioWebView;
@property(strong,nonatomic)IBOutlet UIButton *audioButton;
@property(strong,nonatomic)IBOutlet UIImageView *audioButtonImage;


- (IBAction)stopAudioAndCloseAudioView:(id)aSender;


@end

