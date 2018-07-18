//
//  YDViewXmlParser.h
//  YDKit
//
//  Created by rowena on 2018/7/9.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDViewXmlParser : NSObject

/**
 * 读取配置文件中数据
 * @return 以字典的形式返回字典
 */
- (NSMutableDictionary *)parser;

@end
