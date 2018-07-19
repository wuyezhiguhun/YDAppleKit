//
//  YDLocationService.h
//  YDKit
//
//  Created by rowena on 2018/7/19.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YDLocationServiceDelegate.h"

@protocol YDLocationService <NSObject>

//定义回调协议（目的：就是和外部程序进行交互）
- (void)setDelegate:(id<YDLocationServiceDelegate>)delegate;

//启动定位
- (void)startUserLocationService;

//结束定位
- (void)stopUserLocationService;

@end
