//
//  ViewController.m
//  AccessibilitySample
//
//  Created by magic on 09/03/17.
//  Copyright © 2017 magic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end


@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.helloLabel.isAccessibilityElement = true;
    //self.view.accessibilityElements = [self.helloLabel, self.addLabel, self.submitLabel];
    self.view.accessibilityElements = [NSArray arrayWithObjects:self.helloLabel, self.addLabel, self.submitLabel, nil];
    self.helloLabel.accessibilityLabel = @"hello";
    self.helloLabel.accessibilityHint = @"I am a hint label for hello text";
    self.helloLabel.accessibilityTraits = UIAccessibilityTraitButton;
    
    self.addLabel.accessibilityLabel = @"Add";
    self.addLabel.accessibilityHint = @"I am a hint label for add text";
    
    self.submitLabel.accessibilityLabel = @"Submit";
    self.submitLabel.accessibilityHint = @"I am a hint label for submit text";

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
