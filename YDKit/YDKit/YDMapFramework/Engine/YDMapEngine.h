//
//  YDMapEngine.h
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YDMapFactory.h"

typedef NS_ENUM(NSInteger, YDMapPlatformType) {
    /** 未设置地图模式 */
    YDMapPlatformNoMap = 0,
    /** 百度地图模式 */
    YDMapPlatformBaidu = 1,
    /** 高德地图模式 */
    YDMapPlatformAmap  = 2
};

@interface YDMapEngine : NSObject

+ (instancetype)shareInstance;

//当我们调用alloc时候回调改方法（保证唯一性）
+ (instancetype)allocWithZone:(struct _NSZone *)zone;

/**
 * 设置地图模式
 * @pram type 地图模式
 */
+ (void)setMapPlatformType:(YDMapPlatformType)type;

/**
 * 查看地图模式
 * @return 返回地图模式
 */
+ (YDMapPlatformType)lookMapPlatformType;

//方法初始化功能，可以写在引擎初始化方法中
//初始化引擎对用的地图SDK
- (void)initMap;

//创建工厂
- (id<YDMapFactory>)getMapFactory;


@end
