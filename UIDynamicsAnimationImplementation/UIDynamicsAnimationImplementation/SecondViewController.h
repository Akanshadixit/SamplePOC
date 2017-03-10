//
//  SecondViewController.h
//  UIDynamicsAnimationImplementation
//
//  Created by magic on 03/02/17.
//  Copyright © 2017 magic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *menuView;

@property (nonatomic, strong) UIView *backgroundView;

@property (nonatomic, strong) UITableView *menuTable;

@property (nonatomic, strong) UIDynamicAnimator *animator;


-(void)setupMenuView;
-(void)toggleMenu:(BOOL)shouldOpenMenu;
-(void)handleGesture:(UISwipeGestureRecognizer *)gesture;



@end

