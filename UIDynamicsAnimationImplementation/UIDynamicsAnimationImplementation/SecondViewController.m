//
//  SecondViewController.m
//  UIDynamicsAnimationImplementation
//
//  Created by magic on 03/02/17.
//  Copyright © 2017 magic. All rights reserved.
//

#import "SecondViewController.h"


#define menuWidth 150.0

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupMenuView];
self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    //opening menu
    UISwipeGestureRecognizer *showMenuGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                          action:@selector(handleGesture:)];
    showMenuGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:showMenuGesture];
    
    
 //closing menu
    UISwipeGestureRecognizer *hideMenuGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                          action:@selector(handleGesture:)];
    hideMenuGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.menuView addGestureRecognizer:hideMenuGesture];
    
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupMenuView{
    // Setup the background view.
    self.backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.backgroundView.backgroundColor = [UIColor lightGrayColor];
    self.backgroundView.alpha = 0.0;
    [self.view addSubview:self.backgroundView];
    
    
    
    //set up menu view
    self.menuView = [[UIView alloc] initWithFrame:CGRectMake(-menuWidth,
                                                             20.0,
                                                             menuWidth,
                                                             self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height)];
    
    self.menuView.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
    [self.view addSubview:self.menuView];



    // Setup the table view.
    self.menuTable = [[UITableView alloc] initWithFrame:self.menuView.bounds
                                                  style:UITableViewStylePlain];
    self.menuTable.backgroundColor = [UIColor clearColor];
    self.menuTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.menuTable.scrollEnabled = NO;
    self.menuTable.alpha = 1.0;
    
    self.menuTable.delegate = self;
    self.menuTable.dataSource = self;
    
    [self.menuTable reloadData];
    
    [self.menuView addSubview:self.menuTable];

}

//tableview delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    NSString *menuOptionText = [NSString stringWithFormat:@"Option %d", indexPath.row + 1];
    cell.textLabel.text = menuOptionText;
    
    cell.textLabel.textColor = [UIColor lightGrayColor];
    cell.textLabel.font = [UIFont fontWithName:@"Futura" size:13.0];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
}


//menu toggling
-(void)toggleMenu:(BOOL)shouldOpenMenu{
    [self.animator removeAllBehaviors];
    
    CGFloat gravityDirectionX = (shouldOpenMenu) ? 1.0 : -1.0;
    CGFloat pushMagnitude = (shouldOpenMenu) ? 20.0 : -20.0;
    CGFloat boundaryPointX = (shouldOpenMenu) ? menuWidth : -menuWidth;
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.menuView]];
    gravityBehavior.gravityDirection = CGVectorMake(gravityDirectionX, 0.0);
    [self.animator addBehavior:gravityBehavior];
    
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.menuView]];
    [collisionBehavior addBoundaryWithIdentifier:@"menuBoundary"
                                       fromPoint:CGPointMake(boundaryPointX, 20.0)
                                         toPoint:CGPointMake(boundaryPointX, self.tabBarController.tabBar.frame.origin.y)];
    [self.animator addBehavior:collisionBehavior];
    
    
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[self.menuView]
                                                                    mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.magnitude = pushMagnitude;
    [self.animator addBehavior:pushBehavior];
    
    
    UIDynamicItemBehavior *menuViewBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.menuView]];
    menuViewBehavior.elasticity = 0.4;
    [self.animator addBehavior:menuViewBehavior];
    
    self.backgroundView.alpha = (shouldOpenMenu) ? 0.5 : 0.0;
}

//gesture handling
-(void)handleGesture:(UISwipeGestureRecognizer *)gesture{
    if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        [self toggleMenu:YES];
    }
    else{
        [self toggleMenu:NO];
    }
}


@end
