//
//  ViewController.h
//  Animations
//
//  Created by magic on 24/01/17.
//  Copyright © 2017 magic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *rectView;
@property (weak, nonatomic) IBOutlet UIView *smallRectView;

@property (weak, nonatomic) IBOutlet UIButton *clickMe;

@property (weak, nonatomic) IBOutlet UIView *rotateView;
@property (weak, nonatomic) IBOutlet UIImageView *imageAnimate;
@property (weak, nonatomic) IBOutlet UITextView *loginField;
@property (weak, nonatomic) IBOutlet UIView *orbitView;
@property (weak, nonatomic) IBOutlet UIView *shufleView;

-(IBAction)toggle:(UIButton *)sender;

@end

