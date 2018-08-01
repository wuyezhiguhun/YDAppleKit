//
//  YDAppDelegate.m
//  YDSwiftKit
//
//  Created by 王允顶 on 2018/7/31.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDAppDelegate.h"
#import "YDSwiftKit-Swift.h"

@implementation YDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [YDSwiftModuleRouterUrl loadModuleRouter];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    YDMainController *mainController = [[YDMainController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

@end
