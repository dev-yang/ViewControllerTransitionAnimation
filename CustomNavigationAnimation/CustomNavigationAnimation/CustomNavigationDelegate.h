//
//  CustomNavigationDelegate.h
//  CustomNavigationAnimation
//
//  Created by 杨俊鹏 on 5/26/16.
//  Copyright © 2016 杨俊鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CustomNavigationDelegate : NSObject<UINavigationControllerDelegate>
@property (nonatomic, assign) BOOL isInteractive;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveTransition;
@end
