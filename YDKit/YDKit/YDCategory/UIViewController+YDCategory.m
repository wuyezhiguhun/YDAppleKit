//
//  UIViewController+YDCategory.m
//  YDKit
//
//  Created by rowena on 2018/7/27.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "UIViewController+YDCategory.h"

@implementation UIViewController (YDCategory)

/**
 * 添加导航栏返回点击事件
 */
- (void)addNavigationBack {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"base_back_24"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(navigationBackTouch)];
}
- (void)navigationBackTouch {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
