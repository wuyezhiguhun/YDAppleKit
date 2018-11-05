//
//  YDObjectiveCAppDelegate.m
//  YDObjectiveCKit
//
//  Created by rowena on 2018/10/9.
//  Copyright © 2018年 rowena. All rights reserved.
//

#import "YDObjcAppDelegate.h"
#import "YDMainViewController.h"

@implementation YDObjcAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    YDMainViewController *mainController = [[YDMainViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}

@end
