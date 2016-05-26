//
//  CustomTabBarAnimationDelegate.m
//  CustomTabBarAnimaiton
//
//  Created by 杨俊鹏 on 5/26/16.
//  Copyright © 2016 杨俊鹏. All rights reserved.
//

#import "CustomTabBarAnimationDelegate.h"
#import "CustomAnimator.h"

@implementation CustomTabBarAnimationDelegate

- (instancetype)init {
    if (self = [super init]) {
        self.isInteractive = NO;
        self.interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    return self;
}
- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    NSUInteger fromIndex = [tabBarController.viewControllers indexOfObject:fromVC];
    NSUInteger toIndex = [tabBarController.viewControllers indexOfObject:toVC];
    if (fromIndex < toIndex) {
        return [[CustomAnimator alloc]initWithPresenting:YES];
    }else {
        return [[CustomAnimator alloc]initWithPresenting:NO];
    }
}

- (id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.isInteractive? self.interactiveTransition : nil;
}
@end
