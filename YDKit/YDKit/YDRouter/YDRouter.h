//
//  YDRouter.h
//  YDKit
//
//  Created by rowena on 2018/6/26.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YDRouterType) {
    YDRouterTypeNone            = 0,
    YDRouterTypeViewController  = 1,
    YDRouterTypeBlock           = 2
};

/**
 * Block声明
 * @pram params 传递参数
 */
typedef id (^YDRouterBlock)(NSDictionary *params);

@interface YDRouter : NSObject

/** 创建单例 */
+ (instancetype)shared;
/**
 * 把一个类和一个地址绑定
 * @pram route 绑定的地址
 * @pram controllerClass 绑定的类
 */
- (void)map:(NSString *)route toControllerClass:(Class)controllerClass;
/**
 * 通过路径获取保存的类
 * @pram route 路径
 */
- (UIViewController *)match:(NSString *)route;
/**
 * 通过路径获取保存的类
 * @pram route 路径
 */
- (UIViewController *)matchController:(NSString *)route;
/**
 * 通过路径返回Block
 * @pram route 路径
 */
- (YDRouterBlock)matchBlock:(NSString *)route;
- (id)callBlock:(NSString *)route;
- (void)map:(NSString *)route toBlock:(YDRouterBlock)block;
- (YDRouterType)canRoute:(NSString *)route;
@end

///--------------------------------
/// @name UIViewController Category 分类
///--------------------------------
@interface UIViewController (YDRouter)

@property (nonatomic, strong) NSDictionary *params;

@end
