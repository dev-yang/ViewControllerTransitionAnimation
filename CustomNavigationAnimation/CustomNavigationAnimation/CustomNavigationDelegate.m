//
//  CustomNavigationDelegate.m
//  CustomNavigationAnimation
//
//  Created by 杨俊鹏 on 5/26/16.
//  Copyright © 2016 杨俊鹏. All rights reserved.
//

#import "CustomNavigationDelegate.h"
#import "CustomAnimator.h"
@interface CustomNavigationDelegate()

@end
@implementation CustomNavigationDelegate

- (instancetype)init {
    if (self = [super init]) {
        self.isInteractive = NO;
        self.interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc]init];
    }
    return self;
}
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return [[CustomAnimator alloc]initWithPresenting:YES];
    }else {
        return [[CustomAnimator alloc]initWithPresenting:NO];
    }
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if (self.isInteractive) {
        return self.interactiveTransition;
    }else {
        return nil;
    }
}
@end
