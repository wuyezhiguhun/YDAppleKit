//
//  YDMacro.h
//  YDKit
//
//  Created by rowena on 2018/6/28.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#ifndef YDMacro_h
#define YDMacro_h

#import "YDConstant.h"
#import "UIViewController+YDCategory.h"
#import <YDCategory/YDCategory.h>

#define YDScreenWidth             [UIScreen mainScreen].bounds.size.width
#define YDScreenHeight            [UIScreen mainScreen].bounds.size.height

#ifdef DEBUG
#define SwiftDebug      1
//#define YDLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define SwiftDebug      0
//#define YDLog(fmt, ...)
#endif

#define YDColorHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define YDColorHexAlpha(rgbValue, transparency) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:transparency]
//#define YDColorHexAlpha(rgbValue,alpha) [YDColorHex(rgbValue) colorWithAlphaComponent: alpha]






#endif /* YDMacro_h */
