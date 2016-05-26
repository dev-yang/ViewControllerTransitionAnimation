//
//  ViewController.m
//  CustomNavigationAnimation
//
//  Created by 杨俊鹏 on 16/5/26.
//  Copyright © 2016年 杨俊鹏. All rights reserved.
//

#import "ViewController.h"
#import "CustomNavigationDelegate.h"
#import "SecondViewController.h"

@interface ViewController ()<UINavigationControllerDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)push:(id)sender {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController *svc =  [storyboard instantiateViewControllerWithIdentifier:@"svc"];
    SecondViewController *svc = [[SecondViewController alloc] init];
    svc.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:svc animated:YES];
}

@end
