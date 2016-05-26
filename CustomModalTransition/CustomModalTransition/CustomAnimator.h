//
//  CustomAnimator.h
//  CustomModalTransition
//
//  Created by 杨俊鹏 on 16/5/25.
//  Copyright © 2016年 杨俊鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CustomAnimator : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) BOOL isPresenting;

- (instancetype)initWithPresenting:(BOOL)isPresenting;
@end
