//
//  main.m
//  YDAppleKit
//
//  Created by rowena on 2018/10/9.
//  Copyright © 2018年 rowena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDConstant.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSString *className = [YDConstant shareConstant].appDelegateName;
        return UIApplicationMain(argc, argv, nil, className);
    }
}
