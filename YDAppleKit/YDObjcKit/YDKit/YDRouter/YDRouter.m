//
//  YDRouter.m
//  YDKit
//
//  Created by rowena on 2018/6/26.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDRouter.h"
#import <objc/runtime.h>

//类扩展
@interface YDRouter ()
@property (nonatomic, strong) NSMutableDictionary *routes;
@end

@implementation YDRouter
/** 创建单例 */
+ (instancetype)shared {
    static YDRouter *router = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[YDRouter alloc] init];
    });
    return router;
}
/**
 * 把一个类和一个地址绑定
 * @pram route 绑定的地址
 * @pram controllerClass 绑定的类
 */
- (void)map:(NSString *)route toControllerClass:(Class)controllerClass {
    NSMutableDictionary *subRoutes = [self subRoutesToRoute:route];
    subRoutes[@"_"] = controllerClass;
}

/**
 * 通过路径获取保存的类
 * @pram route 路径
 */
- (UIViewController *)match:(NSString *)route {
    return [self matchController:route];
}
/**
 * 通过路径获取保存的类
 * @pram route 路径
 */
- (UIViewController *)matchController:(NSString *)route {
    NSDictionary *params = [self paramsInRoute:route];
    Class controllerClass = [params objectForKey:@"controller_class"];
    UIViewController *viewController = [[controllerClass alloc] init];
    if ([viewController respondsToSelector:@selector(setParams:)]) {
        [viewController performSelector:@selector(setParams:) withObject:[params copy]];
    }
    return viewController;
}
/**
 * 通过路径返回Block
 * @pram route 路径
 */
- (YDRouterBlock)matchBlock:(NSString *)route {
    NSDictionary *params = [self paramsInRoute:route];
    if (!params) {
        return nil;
    }
    YDRouterBlock routerBlock = [[params objectForKey:@"block"] copy];
    YDRouterBlock returnBlock = ^id(NSDictionary *blockParams) {
        if (routerBlock) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:params];
            [dict addEntriesFromDictionary:blockParams];
            return routerBlock([[NSDictionary dictionaryWithDictionary:dict] copy]);
        }
        return nil;
    };
    return [returnBlock copy];
}
/**
 *
 */
- (void)map:(NSString *)route toBlock:(YDRouterBlock)block {
    NSMutableDictionary *subRoutes = [self subRoutesToRoute:route];
    subRoutes[@"_"] = [block copy];
}
- (id)callBlock:(NSString *)route {
    NSDictionary *params = [self paramsInRoute:route];
    YDRouterBlock routerBlock = [[params objectForKey:@"block"] copy];
    if (routerBlock) {
        return routerBlock([params copy]);
    }
    return nil;
}
- (YDRouterType)canRoute:(NSString *)route {
    NSDictionary *params = [self paramsInRoute:route];
    if ([params objectForKey:@"controller_class"]) {
        return YDRouterTypeViewController;
    }
    if ([params objectForKey:@"block"]) {
        return YDRouterTypeBlock;
    }
    return YDRouterTypeNone;
}
/**
 * 通过路径获取参数
 * @pram route 路径
 */
- (NSDictionary *)paramsInRoute:(NSString *)route {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"route"] = [self stringFromFilterAppUrlScheme:route];
    NSMutableDictionary *subRoutes = self.routes;
    NSArray *pathComponents = [self pathComponentsFromRoute:[params objectForKey:@"route"]];
    for (NSString *pathComponent in pathComponents) {
        BOOL found = NO;
        NSArray *subRoutesKeys = subRoutes.allKeys;
        for (NSString *key in subRoutesKeys) {
            if ([subRoutesKeys containsObject:pathComponent]) {
                found = YES;
                subRoutes = [subRoutes objectForKey:pathComponent];
                break;
            } else if ([key hasPrefix:@":"]) {
                found = YES;
                subRoutes = [subRoutes objectForKey:key];
                params[[key substringFromIndex:1]] = pathComponent;
            }
        }
        if (!found) {
            return nil;
        }
    }
    
    //Extract Params From Query.
    NSRange firstRange = [route rangeOfString:@"?"];
    if (firstRange.location != NSNotFound && route.length > firstRange.location + firstRange.length) {
        NSString *paramsString = [route substringFromIndex:firstRange.location + firstRange.length];
        NSArray *paramStringArray = [paramsString componentsSeparatedByString:@"&"];
        for (NSString *paramString in paramStringArray) {
            NSArray *paramArray = [paramString componentsSeparatedByString:@"="];
            if ([paramArray count] > 1) {
                NSString *key = [paramArray objectAtIndex:0];
                NSString *value = [paramArray objectAtIndex:1];
                params[key] = value;
            }
        }
    }
    Class class = [subRoutes objectForKey:@"_"];
    if (class_isMetaClass(object_getClass(class))) {
        if ([class isSubclassOfClass:[UIViewController class]]) {
            params[@"controller_class"] = [subRoutes objectForKey:@"_"];
        } else {
            return nil;
        }
    } else {
        if ([subRoutes objectForKey:@"_"]) {
            params[@"block"] = [[subRoutes objectForKey:@"_"] copy];
        }
    }
    return [NSDictionary dictionaryWithDictionary:params];
}
- (NSString *)stringFromFilterAppUrlScheme:(NSString *)string {
    for (NSString *appUrlScheme in [self appUrlSchemes]) {
        if ([string hasPrefix:[NSString stringWithFormat:@"%@:",appUrlScheme]]) {
            return [string substringFromIndex:appUrlScheme.length + 2];
        }
    }
    return string;
}
- (NSArray *)appUrlSchemes {
    NSMutableArray *appUrlSchemes = [NSMutableArray array];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    for (NSDictionary *dict in [infoDictionary objectForKey:@"CFBundleURLTypes"]) {
        NSString *appUrlScheme = [dict objectForKey:@"CFBundleURLSchemes"][0];
        [appUrlSchemes addObject:appUrlScheme];
    }
    return [appUrlSchemes copy];
}
- (NSMutableDictionary *)subRoutesToRoute:(NSString *)route {
    NSArray *pathComponents = [self pathComponentsFromRoute:route];
    NSInteger index = 0;
    NSMutableDictionary *subRoutes = self.routes;
    while (index < pathComponents.count) {
        NSString *pathComponent = [pathComponents objectAtIndex:index];
        if (![subRoutes objectForKey:pathComponent]) {
            subRoutes[pathComponent] = [[NSMutableDictionary alloc] init];
        }
        subRoutes = subRoutes[pathComponent];
        index ++;
    }
    return subRoutes;
}
/**
 * 把URL路劲转换成path数组
 * @pram route URL路径
 * @return path数组
 */
- (NSArray *)pathComponentsFromRoute:(NSString *)route {
    //组件的路劲
    NSMutableArray *pathComponents = [NSMutableArray array];
    //字符串去除特殊字符转URL
    NSURL *url = [NSURL URLWithString:[route stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    for (NSString *pathComponent in url.path.pathComponents) {
        //去除 "/"
        if ([pathComponent isEqualToString:@"/"]) {
            continue ;
        }
        //遇到第一个是 "?" 退出
        if ([[pathComponent substringToIndex:1] isEqualToString:@"?"]) {
            break ;
        }
        [pathComponents addObject:[pathComponent stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    
    return [pathComponents copy];
}
#pragma mark -- get 函数
- (NSMutableDictionary *)routes {
    if (!_routes) {
        _routes = [[NSMutableDictionary alloc] init];;
    }
    return _routes;
}
@end

#pragma mark -- UIViewController Category

@implementation UIViewController (YDRouter)
static char kAssociatedParamsObjectKey;

- (void)setParams:(NSDictionary *)params {
    objc_setAssociatedObject(self, &kAssociatedParamsObjectKey, params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSDictionary *)params {
    return objc_getAssociatedObject(self, &kAssociatedParamsObjectKey);
}

@end
