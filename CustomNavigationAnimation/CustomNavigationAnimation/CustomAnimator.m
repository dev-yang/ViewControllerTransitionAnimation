//
//  CustomAnimator.m
//  CustomModalTransition
//
//  Created by 杨俊鹏 on 16/5/25.
//  Copyright © 2016年 杨俊鹏. All rights reserved.
//

#import "CustomAnimator.h"

@implementation CustomAnimator
- (instancetype)initWithPresenting:(BOOL)isPresenting {
    if (self = [super init]) {
        self.isPresenting = isPresenting;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.7;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView;
    UIView *toView;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromViewController.view;
        toView = toViewController.view;
    }
    UIView *containerView = [transitionContext containerView];
    /*containerView会默认添加fromView，所以在present的时候需要添加toView,而在
     dismiss的时候需要移除fromView（当然，不移除也不会出问题，因为动画结束时，
     containerView会释放掉，其上的子视图当然也会释放掉),而且需要添加toView,否则会出
     现一瞬间的黑屏（这取决于window的背景色）
     */
    if (self.isPresenting) {
        toView.alpha = 0;
        //因为是用xib初始化SecondViewController的,在这里自动布局没有起作用,所以要加这句话
        toView.frame = [transitionContext finalFrameForViewController:toViewController];
        toView.layer.position = CGPointMake(0, 0);
        toView.layer.anchorPoint = CGPointMake(0, 0);
        CGAffineTransform transform = CGAffineTransformMakeRotation(-M_PI);
        [toView.layer setAffineTransform:transform];
        [containerView addSubview:toView];
    }else {
        fromView.layer.position = CGPointMake(containerView.frame.size.width, 0);
        fromView.layer.anchorPoint = CGPointMake(1, 0);
        [containerView insertSubview:toView belowSubview:fromView];
        
    }
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        if (self.isPresenting) {
            toView.alpha = 1;
            [toView setTransform:CGAffineTransformMakeRotation(0)];
        } else {
            fromView.alpha = 0;
            [fromView setTransform:CGAffineTransformMakeRotation(M_PI)]
            ;
        }

    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        if (!self.isPresenting && !wasCancelled) {
            [fromView removeFromSuperview];
        }
        [transitionContext completeTransition:!wasCancelled];

    }];
    
}
- (void)animationEnded:(BOOL)transitionCompleted {
    NSLog(@"animationEnded!");
}
@end
