//
//  ViewController.m
//  CustomModalTransition
//
//  Created by 杨俊鹏 on 16/5/25.
//  Copyright © 2016年 杨俊鹏. All rights reserved.
//

#import "ViewController.h"
#import "CustomTransitionDelegate.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    CustomTransitionDelegate *customTransitionDelegate;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    customTransitionDelegate = [[CustomTransitionDelegate alloc] init];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]init];
    [pan addTarget:self action:@selector(handlePanGesture:)];
    [self.view addGestureRecognizer:pan];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)pan {
    CGFloat translationX = [pan translationInView:self.view].x;
    CGFloat translationAbs = translationX > 0 ? translationX : -translationX;
    CGFloat progress = translationAbs / self.view.frame.size.width;
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            customTransitionDelegate.isInteractive = YES;
            CGFloat velocityX = [pan velocityInView:self.view].x;
            if (velocityX < 0) {
                [self present:nil];
            }
            break;
        case UIGestureRecognizerStateChanged:
            [customTransitionDelegate.interactiveTransition updateInteractiveTransition:progress];
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
            if (progress > 0.3) {
                [customTransitionDelegate.interactiveTransition finishInteractiveTransition];
            }else {
                [customTransitionDelegate.interactiveTransition cancelInteractiveTransition];
            }
            customTransitionDelegate.isInteractive = NO;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)present:(id)sender {
    SecondViewController *svc = [[SecondViewController alloc] init];;
    svc.transitioningDelegate = customTransitionDelegate;
    [self presentViewController:svc animated:YES completion:^{
        NSLog(@"presentAnimation completion!");
    }];
}

@end
