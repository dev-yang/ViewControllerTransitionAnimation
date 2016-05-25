//
//  SecondViewController.m
//  TransitionAnimation
//
//  Created by 杨俊鹏 on 16/5/24.
//  Copyright © 2016年 杨俊鹏. All rights reserved.
//

#import "SecondViewController.h"
#import "ThreeViewController.h"

@interface SecondViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    // Do any additional setup after loading the view.
}

- (void)setupViews {
    self.view.backgroundColor = [UIColor greenColor];
    UIPickerView *pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:pickView];
    pickView.center = self.view.center;
    pickView.delegate = self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataArr.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.dataArr[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    ThreeViewController * tvc = [[ThreeViewController alloc] init];
    if ([self.title isEqualToString:@"Modal"]) {
        tvc.isModal = YES;
        tvc.modalTransitionStyle = row;
        [self presentViewController:tvc animated:YES completion:nil];
    }else {
        tvc.isModal = NO;
        CATransition *transition = [CATransition animation];
        transition.duration = 0.5;
        transition.type = self.dataArr[row];
        [self.navigationController.view.layer addAnimation:transition forKey:nil];
        [self.navigationController pushViewController:tvc animated:NO];
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
