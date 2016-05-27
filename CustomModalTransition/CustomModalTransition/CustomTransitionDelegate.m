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

- (instancetype)init {
    if (self = [super init]) {
        self.isInteractive = NO;
        self.interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    return self;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[CustomAnimator alloc] initWithPresenting:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[CustomAnimator alloc] initWithPresenting:NO];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator {
    if (self.isInteractive) {
        return self.interactiveTransition;
    }else {
        return nil;
    }
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    if (self.isInteractive) {
        return self.interactiveTransition;
    }else {
        return nil;
    }
}

@end
