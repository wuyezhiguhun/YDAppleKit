//
//  YDViewFactory.h
//  YDKit
//
//  Created by rowena on 2018/7/9.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDViewFactory : NSObject

/**
 * 创建类
 * @pram key 需要创建的类的key
 * @return 返回工厂创建的类
 */
+ (NSObject *)getInstance:(NSString *)key;

@end
