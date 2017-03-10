//
//  FirstViewController.h
//  UIDynamicsAnimationImplementation
//
//  Created by magic on 03/02/17.
//  Copyright © 2017 magic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UICollisionBehaviorDelegate>

@property (nonatomic) BOOL isBallRolling;


@property (nonatomic, strong) UIView *paddle;

@property (nonatomic) CGPoint paddleCenterPoint;

-(void)demoGravity;
-(void)playWithBall;


@end

