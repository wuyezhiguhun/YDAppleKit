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

    [YDSwiftModuleRouterUrl loadModuleRouter];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    YDSwiftMainController *mainController = [[YDSwiftMainController alloc] init];
    UINavigationController *navigateionController = [[UINavigationController alloc] initWithRootViewController:mainController];
    self.window.rootViewController = navigateionController;
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}

@end
