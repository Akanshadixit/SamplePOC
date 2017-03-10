//
//  ViewController.m
//  Animations
//
//  Created by magic on 24/01/17.
//  Copyright © 2017 magic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize rectView;
@synthesize smallRectView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self uiViewAnimationImplementation];
    //[self animateImages];
    //[self toAndFroAnimation];
    //[self rotateAndMoveAnimation];
    //[self runSpinAnimationOnView:smallRectView duration:10.0 rotations:1 repeat:10];
    //[self runAnimation];
    
//    CALayer *layer = [CALayer layer];
//    [layer setPosition:CGPointMake(100.0, 100.0)];
//    [layer setBounds:CGRectMake(0.0, 0.0, 50.0, 60.0)];
//    [layer setBackgroundColor:[[UIColor redColor] CGColor]];
//    [self.view.layer addSublayer:layer];
    
    
   
    
    CAAnimationGroup *anim = [CAAnimationGroup animation];
    [anim setAnimations:[NSArray arrayWithObjects:[self transparencyAnimation], [self translateAnimation], nil]];
    [anim setDuration:3.0];
    [anim setRemovedOnCompletion:NO];
    [anim setFillMode:kCAFillModeBoth];
    [anim setAutoreverses:YES];
    [anim setRepeatCount:INFINITY];
    [self.imageAnimate.layer addAnimation:anim forKey:nil];
    
    [self bounce];
    [self loginFormAnimation];
    [self orbitAnimation];
    //[self shufflingCardAnimation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//animation with angle
-(void)uiViewAnimationImplementation{
    
    [UIView animateWithDuration:1.0 animations:^
    {
        [rectView setAlpha:1.0];
        [rectView setCenter:CGPointMake(200, 200)];
        //[rectView setTransform:CGAffineTransformMakeRotation(45.0)];
       // [UIView transitionFromView:rectView toView:smallRectView duration:2.0 options:UIViewAnimationOptionTransitionCurlUp completion:nil];
        
        [rectView setTransform:CGAffineTransformRotate(rectView.transform, 90.0f)];
        
//        [UIView transitionWithView:rectView duration:2.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:^(BOOL finished)
//         {
//             NSLog(@"done animation");
//         }];
    }];
}

//images changing
-(void)animateImages{
    NSArray *imageNames = @[@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"egg_benedict.jpg", @"full_breakfast.jpg"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    // Normal Animation
    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 495, 86, 193)];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 1.5;
    
    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
    
    
    
    
    
    UIImageView *slowAnimationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(160, 495, 86, 193)];
    slowAnimationImageView.animationImages = images;
    slowAnimationImageView.animationDuration = 5;
    
    [self.view addSubview:slowAnimationImageView];
    [slowAnimationImageView startAnimating];
}

//animate to and fro
-(void)toAndFroAnimation{
    UIView * testView = [[UIView alloc] initWithFrame:CGRectMake(200.0f, 100.0f, 100.0f, 20.0f)];
    [testView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:testView];
    
    [UIView animateWithDuration:1.5f
                          delay:0.0f
                        options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         [testView setFrame:CGRectMake(0.0f, 100.0f, 100.0f, 20.0f)];
                     }
                     completion:nil];
    
   // [testView release];
}

//clockwise and anticlockwise rotation

- (IBAction)toggle:(UIButton *)sender {
    [UIView animateWithDuration:0.2 animations:^{
        if (CGAffineTransformEqualToTransform(smallRectView.transform, CGAffineTransformIdentity)) {
            smallRectView.transform = CGAffineTransformMakeRotation(M_PI * 0.999);
        } else {
            smallRectView.transform = CGAffineTransformIdentity;
        }
    }];
}


//move and rotate
-(void)rotateAndMoveAnimation{
    CGAffineTransform translate = CGAffineTransformMakeTranslation(self.rotateView.frame.origin.x,self.rotateView.frame.origin.y - 5);
    CGAffineTransform scale = CGAffineTransformMakeScale(0.2, 0.2);
    CGAffineTransform transform =  CGAffineTransformConcat(translate, scale);
    transform = CGAffineTransformRotate(transform, M_PI);
    
    // animation using block code
    [UIView animateWithDuration:10.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _rotateView.transform = transform;
                     }completion:^(BOOL finished){
                         // do something if needed
                     }];
}

//planet rotation
- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    //[anim setFillMode:kCAFillModeForwards];
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}


//planet rotation
-(void)runAnimation{
    CGPoint point0 = smallRectView.layer.position;
    CGPoint point1 = { point0.x + 50, point0.y };
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position.x"];
    anim.fromValue    = @(point0.x);
    anim.toValue  = @(450);//@(point1.x + 50);
    anim.duration   = 10.0f;
    anim.repeatCount = 10;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    // First we update the model layer's property.
    //smallRectView.layer.position = point1;
    
    // Now we attach the animation.
    [smallRectView.layer  addAnimation:anim forKey:@"position.x"];

}


- (CABasicAnimation *)transparencyAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [animation setFromValue:[NSNumber numberWithFloat:1.0f]];
    [animation setToValue:[NSNumber numberWithFloat:0.2f]];
    return animation;
}

- (CABasicAnimation *)translateAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setFromValue:[NSValue valueWithCGPoint:CGPointMake(100.0, 100.0)]];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(100.0, 250.0)];
    return animation;
}


//jumping and bouncing
-(CAKeyframeAnimation *)dockBounceAnimationWithIconHeight:(CGFloat)iconHeight
{
    CGFloat factors[32] = {0, 32, 60, 83, 100, 114, 124, 128, 128, 124, 114, 100, 83, 60, 32,
        0, 24, 42, 54, 62, 64, 62, 54, 42, 24, 0, 18, 28, 32, 28, 18, 0};
    
    NSMutableArray *values = [NSMutableArray array];
    
    for (int i=0; i<32; i++)
    {
        CGFloat positionOffset = factors[i]/128.0f * iconHeight;
        
        CATransform3D transform = CATransform3DMakeTranslation(0, -positionOffset, 0);
        [values addObject:[NSValue valueWithCATransform3D:transform]];
    }
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.repeatCount = INFINITY;
    animation.duration = 32.0f/30.0f;
    animation.fillMode = kCAFillModeForwards;
    animation.values = values;
    animation.removedOnCompletion = YES; // final stage is equal to starting stage
    animation.autoreverses = NO;
    
    return animation;
}

- (void)bounce
{
    [smallRectView.layer addAnimation:[self dockBounceAnimationWithIconHeight:150] forKey:@"jumping"];
}

//shaking animation
-(void)loginFormAnimation{
CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
animation.keyPath = @"position.x";
animation.values = @[ @0, @10, @-10, @10, @0 ];
animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
animation.duration = 0.4;
animation.repeatCount = INFINITY;
animation.additive = YES;

[self.loginField.layer addAnimation:animation forKey:@"shake"];
}




//orbit Animation
-(void)orbitAnimation{
CGRect boundingRect = CGRectMake(-150, -150, 300, 300);

CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
orbit.keyPath = @"position";
orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
orbit.duration = 4;
orbit.additive = YES;
orbit.repeatCount = HUGE_VALF;
orbit.calculationMode = kCAAnimationPaced;
orbit.rotationMode = kCAAnimationRotateAuto;

[self.orbitView.layer addAnimation:orbit forKey:@"orbit"];

}






////card shuffle
//-(void)shufflingCardAnimation{
//CABasicAnimation *zPosition = [CABasicAnimation animation];
//zPosition.keyPath = @"zPosition";
//zPosition.fromValue = @-1;
//zPosition.toValue = @1;
//zPosition.duration = 1.2;
//
//CAKeyframeAnimation *rotation = [CAKeyframeAnimation animation];
//rotation.keyPath = @"transform.rotation";
//rotation.values = @[ @0, @0.14, @0 ];
//rotation.duration = 1.2;
//rotation.timingFunctions = @[
//                             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
//                             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
//                             ];
//
//CAKeyframeAnimation *position = [CAKeyframeAnimation animation];
//position.keyPath = @"position";
//position.values = @[
//                    [NSValue valueWithCGPoint:CGPointZero],
//                    [NSValue valueWithCGPoint:CGPointMake(110, -20)],
//                    [NSValue valueWithCGPoint:CGPointZero]
//                    ];
//position.timingFunctions = @[
//                             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
//                             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
//                             ];
//position.additive = YES;
//position.duration = 1.2;
//
//CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
//group.animations = @[ zPosition, rotation, position ];
//group.duration = 1.2;
//group.beginTime = 0.5;
//
//[self.shufleView.layer addAnimation:group forKey:@"shuffle"];
//
//self.shufleView.layer.zPosition = 1;
//
//}

@end
