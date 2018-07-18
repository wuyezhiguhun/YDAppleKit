//
//  YDMapEngine.m
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDMapEngine.h"
#import "YDMapPlatform.h"
#import "YDMapPlatformXmlParser.h"
#import "YDMapPlatformPlistParser.h"

@interface YDMapEngine()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation YDMapEngine

//单例模式
static YDMapEngine *instance = nil;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YDMapEngine alloc] init];
    });
    return instance;
}

//当我们调用alloc时候回调改方法（保证唯一性）
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            instance = [super allocWithZone:zone];
        });
    }
    return instance;
}

/**
 * 设置地图模式
 * @pram type 地图模式
 */
+ (void)setMapPlatformType:(YDMapPlatformType)type {
    switch (type) {
        case YDMapPlatformBaidu:
            [YDMapPlatformPlistParser setMapType:@"baidu"];
            break;
        case YDMapPlatformAmap:
            [YDMapPlatformPlistParser setMapType:@"amap"];
            break;
            
        default:
            break;
    }
}
/**
 * 查看地图模式
 * @return 返回地图模式
 */
+ (YDMapPlatformType)lookMapPlatformType {
    NSString *type = [YDMapPlatformPlistParser lookMapType];
    if ([type isEqualToString:@"baidu"]) {
        return YDMapPlatformBaidu;
    }
    if ([type isEqualToString:@"amap"]) {
        return YDMapPlatformAmap;
    }
    return YDMapPlatformNoMap;
}

//方法初始化功能，可以写在引擎初始化方法中
//初始化引擎对用的地图SDK
- (void)initMap {
//    //xml 保存设置初始化
//    YDMapPlatformXmlParser *xmlParser = [[YDMapPlatformXmlParser alloc] init];
//    self.array = [xmlParser parser];

    //plist 保存设置初始化
    self.array = [YDMapPlatformPlistParser parser];
}

//创建工厂
- (id<YDMapFactory>)getMapFactory {
    //循环遍历创建你想要的创建的工厂
    @try {
        for (YDMapPlatform *platform in self.array) {
            if ([platform.isOpen isEqualToString:@"YES"]) {
                id<YDMapFactory> factory = [[NSClassFromString(platform.factoryName) alloc] initWithAppKey:platform.appKey];
                return factory;
            }
        }
    } @catch (NSException *exception) {
        NSLog(@"创建工厂错误，请检查配置文件是否配置正确！");
    }
    return nil;
}



@end
