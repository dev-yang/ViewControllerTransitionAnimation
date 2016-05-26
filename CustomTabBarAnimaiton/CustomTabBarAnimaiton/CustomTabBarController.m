//
//  CustomTabBarController.m
//  CustomTabBarAnimaiton
//
//  Created by 杨俊鹏 on 5/26/16.
//  Copyright © 2016 杨俊鹏. All rights reserved.
//

#import "CustomTabBarController.h"
#import "CustomTabBarAnimationDelegate.h"

@interface CustomTabBarController ()
{
    CustomTabBarAnimationDelegate *customTabBarAnimationDelegate;
}
@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    [pan addTarget:self action:@selector(handlePanGesture:)];
    customTabBarAnimationDelegate = [[CustomTabBarAnimationDelegate alloc] init];
    self.delegate = customTabBarAnimationDelegate;
    [self.view addGestureRecognizer:pan];
    // Do any additional setup after loading the view.
}


- (void)handlePanGesture:(UIPanGestureRecognizer *)pan {
    CGFloat translationX = [pan translationInView:self.view].x;
    CGFloat translationAbs = translationX > 0 ? translationX : -translationX;
    CGFloat progress = translationAbs / self.view.frame.size.width;
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            customTabBarAnimationDelegate.isInteractive = YES;
            CGFloat velocityX = [pan velocityInView:self.view].x;
            if (velocityX < 0) {
                if (self.selectedIndex < self.viewControllers.count) {
                    self.selectedIndex += 1;
                }
            } else {
                if (self.selectedIndex > 0) {
                    self.selectedIndex -= 1;
                }
            }
            break;
        case UIGestureRecognizerStateChanged:
            [customTabBarAnimationDelegate.interactiveTransition updateInteractiveTransition:progress];
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
            if (progress > 0.3) {
                //https://github.com/seedante/iOS-ViewController-Transition-Demo 参考这里的Demo
                //如果不设置这里，会出现黑屏现象，具体的原因还没有找到
                customTabBarAnimationDelegate.interactiveTransition.completionSpeed = 0.99;
                [customTabBarAnimationDelegate.interactiveTransition finishInteractiveTransition];
            }else {
                customTabBarAnimationDelegate.interactiveTransition.completionSpeed = 0.99;
                [customTabBarAnimationDelegate.interactiveTransition cancelInteractiveTransition];
            }
            customTabBarAnimationDelegate.isInteractive = NO;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
