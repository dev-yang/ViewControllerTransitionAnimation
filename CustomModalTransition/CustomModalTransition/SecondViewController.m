//
//  SecondViewController.m
//  CustomModalTransition
//
//  Created by 杨俊鹏 on 16/5/25.
//  Copyright © 2016年 杨俊鹏. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomTransitionDelegate.h"

@interface SecondViewController ()
{
    CustomTransitionDelegate *customTransitionDelegate;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    customTransitionDelegate = self.transitioningDelegate;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]init];
    [pan addTarget:self action:@selector(handlePanGesture:)];
    [self.view addGestureRecognizer:pan];

    // Do any additional setup after loading the view from its nib.
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)pan {
    CGFloat translationX = [pan translationInView:self.view].x;
    CGFloat translationAbs = translationX > 0 ? translationX : -translationX;
    CGFloat progress = translationAbs / self.view.frame.size.width;
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            customTransitionDelegate.isInteractive = YES;
            CGFloat velocityX = [pan velocityInView:self.view].x;
            if (velocityX > 0) {
                [self dismiss:nil];
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
- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismiss animation completion!");
    }];
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
