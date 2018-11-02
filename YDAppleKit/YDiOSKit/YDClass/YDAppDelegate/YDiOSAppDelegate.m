//
//  YDiOSAppDelegate.m
//  YDAppleKit
//
//  Created by rowena on 2018/10/24.
//  Copyright © 2018年 wuyezhiguhun. All rights reserved.
//

#import "YDiOSAppDelegate.h"
#import "YDiOSMainController.h"

@implementation YDiOSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    YDiOSMainController *mainController = [[YDiOSMainController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}

@end
