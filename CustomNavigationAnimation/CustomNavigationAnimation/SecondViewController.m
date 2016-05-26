//
//  SecondViewController.m
//  CustomNavigationAnimation
//
//  Created by 杨俊鹏 on 5/26/16.
//  Copyright © 2016 杨俊鹏. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomNavigationDelegate.h"


@interface SecondViewController ()
{
    CustomNavigationDelegate *customNavigationDelegate;
    UIScreenEdgePanGestureRecognizer *edgePanGesture;
}
@end

@implementation SecondViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    edgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] init];
    edgePanGesture.edges = UIRectEdgeRight;
    [edgePanGesture addTarget:self action:@selector(handleEdgePanGesture:)];
    [self.view addGestureRecognizer:edgePanGesture];
    // Do any additional setup after loading the view.
}


- (void)handleEdgePanGesture:(UIScreenEdgePanGestureRecognizer *)gesture {
    CGFloat translationX = [gesture translationInView:self.view].x;
    CGFloat translationBase = self.view.frame.size.width/3;
    CGFloat translationAbs = translationX > 0 ? translationX:-translationX;
    CGFloat precent = translationAbs > translationBase ? 1.0 : translationAbs/translationBase;
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            customNavigationDelegate = self.navigationController.delegate;
            customNavigationDelegate.isInteractive = YES;
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            [customNavigationDelegate.interactiveTransition updateInteractiveTransition:precent];
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            if (precent >= 0.5) {
                [customNavigationDelegate.interactiveTransition finishInteractiveTransition];
            }else {
                [customNavigationDelegate.interactiveTransition cancelInteractiveTransition];
            }
            customNavigationDelegate.isInteractive = NO;
            break;

        }
        default:
            [customNavigationDelegate.interactiveTransition cancelInteractiveTransition];
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
