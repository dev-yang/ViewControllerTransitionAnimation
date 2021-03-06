//
//  ViewController.m
//  TransitionAnimation
//
//  Created by 杨俊鹏 on 16/5/24.
//  Copyright © 2016年 杨俊鹏. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)modalAction:(id)sender {
    SecondViewController *svc = [[SecondViewController alloc] init];
    svc.title = @"Modal";
    svc.dataArr = @[@"CoverVertical", @"FlipHorizontal", @"CrossDissolve", @"PartialCurl"];
    [self.navigationController pushViewController:svc animated:NO];
}

- (IBAction)navigationAction:(id)sender {
    SecondViewController *svc = [[SecondViewController alloc] init];
    svc.title = @"Navigation";
    svc.dataArr = @[kCATransitionMoveIn, kCATransitionFade, kCATransitionPush, kCATransitionReveal, @"cube", @"pageCurl",@"cameraIrisHollowOpen"];
    [self.navigationController pushViewController:svc animated:NO];

}


@end
