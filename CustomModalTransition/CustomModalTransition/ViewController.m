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
    // Do any additional setup after loading the view, typically from a nib.
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
