//
//  ViewController.m
//  CustomNavigationAnimation
//
//  Created by 杨俊鹏 on 16/5/26.
//  Copyright © 2016年 杨俊鹏. All rights reserved.
//

#import "ViewController.h"
#import "CustomNavigationDelegate.h"

@interface ViewController ()<UINavigationControllerDelegate>
{
    CustomNavigationDelegate *customNavigationDelegate;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    customNavigationDelegate = [[CustomNavigationDelegate alloc]init];
    self.navigationController.delegate = customNavigationDelegate;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)push:(id)sender {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController *svc =  [storyboard instantiateViewControllerWithIdentifier:@"svc"];
    UIViewController *svc = [[UIViewController alloc] init];
    svc.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:svc animated:YES];
}

@end
