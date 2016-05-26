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

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return [[CustomAnimator alloc]initWithPresenting:YES];
    }else {
        return [[CustomAnimator alloc]initWithPresenting:NO];
    }
}

@end
