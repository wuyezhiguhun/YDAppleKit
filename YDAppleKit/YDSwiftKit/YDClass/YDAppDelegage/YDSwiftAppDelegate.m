//
//  YDSwiftAppDelegate.m
//  YDAppleKit copy
//
//  Created by rowena on 2018/10/9.
//  Copyright © 2018年 rowena. All rights reserved.
//

#import "YDSwiftAppDelegate.h"
#import "YDSwiftKit-Swift.h"
//#import "YDMainViewController.h"

@implementation YDSwiftAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
////    [YDSwiftModuleRouterUrl load];
//    YDSwiftModuleRouterUrl *moduleRouter = [[YDSwiftModuleRouterUrl alloc] init];
////    [moduleRouter loadModuleRouter];
//    [YDSwiftModuleRouterUrl loadModuleRouter];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    YDMainController *mainController = [[YDMainController alloc] init];
    UINavigationController *navigateionController = [[UINavigationController alloc] initWithRootViewController:mainController];
    self.window.rootViewController = navigateionController;
    [self.window makeKeyAndVisible];
    
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    YDMainViewController *mainController = [[YDMainViewController alloc] init];
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainController];
//    self.window.rootViewController = navigationController;
//    [self.window makeKeyAndVisible];

    
    // Override point for customization after application launch.
    return YES;
}

@end
