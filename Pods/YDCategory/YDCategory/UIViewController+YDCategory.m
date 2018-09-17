//
//  UIViewController+YDCategory.m
//  Category
//
//  Created by rowena on 2018/9/12.
//  Copyright © 2018年 rowena. All rights reserved.
//

#import "UIViewController+YDCategory.h"

@implementation UIViewController (YDCategory)

/**
 * 两个按钮消息提示空间
 * @pram title 标题
 * @pram message 消息
 * @pram accept 确定 按钮 名称
 * @pram cancel 取消 按钮 名称
 * @pram acceptHandler 确定 按钮 点击 back回调
 * @pram cancelHandler 取消 按钮 点击 back回调
 */
- (void)messageAlertTitle:(NSString *)title
                  message:(NSString *)message
                   accept:(NSString *)accept
                   cancel:(NSString *)cancel
            acceptHandler:(void (^)(UIAlertAction *action))acceptHandler
            cancelHandler:(void (^)(UIAlertAction *action))cancelHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *acceptAction = [UIAlertAction actionWithTitle:accept style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        acceptHandler(action);
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelHandler(action);
    }];
    [alertController addAction:acceptAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

/**
 * 两个按钮消息提示空间 带类型
 * @pram title          标题
 * @pram message        消息
 * @pram accept         确定 按钮 名称
 * @pram cancel         取消 按钮 名称
 * @pram style          提示框类型
 * @pram acceptHandler  确定 按钮 点击 back回调
 * @pram cancelHandler  取消 按钮 点击 back回调
 */
- (void)messageAlertTitle:(NSString *)title
                  message:(NSString *)message
                   accept:(NSString *)accept
                   cancel:(NSString *)cancel
           preferredStyle:(UIAlertControllerStyle)style
            acceptHandler:(void (^)(UIAlertAction *action))acceptHandler
            cancelHandler:(void (^)(UIAlertAction *action))cancelHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    UIAlertAction *acceptAction = [UIAlertAction actionWithTitle:accept style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        acceptHandler(action);
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelHandler(action);
    }];
    [alertController addAction:acceptAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

/**
 * 一个按钮消息提示空间 带类型
 * @pram title          标题
 * @pram message        消息
 * @pram accept         确定 按钮 名称
 * @pram style          提示框类型
 * @pram acceptHandler  确定 按钮 点击 back回调
 */
- (void)messageAlertTitle:(NSString *)title
                  message:(NSString *)message
                   accept:(NSString *)accept
           preferredStyle:(UIAlertControllerStyle)style
            acceptHandler:(void (^)(UIAlertAction *action))acceptHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    UIAlertAction *acceptAction = [UIAlertAction actionWithTitle:accept style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        acceptHandler(action);
    }];
    [alertController addAction:acceptAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
