//
//  main.m
//  YDKit
//
//  Created by 王允顶 on 2018/6/24.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSString *className = [YDConstant shareConstant].appDelegateName;
//        Class *objClass = NSClassFromString([YDConstant shareConstant].appDelegateName);
        return UIApplicationMain(argc, argv, nil, className);
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
