//
//  CustomTransitionDelegate.m
//  CustomModalTransition
//
//  Created by 杨俊鹏 on 16/5/25.
//  Copyright © 2016年 杨俊鹏. All rights reserved.
//

#import "CustomTransitionDelegate.h"
#import "CustomAnimator.h"
@interface CustomTransitionDelegate()

@end
@implementation CustomTransitionDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[CustomAnimator alloc] initWithPresenting:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[CustomAnimator alloc] initWithPresenting:NO];
}

//- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator {
//    
//}
//
//- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
//    
//}

@end
