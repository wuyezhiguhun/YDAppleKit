//
//  YDMapPlatform.h
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDMapPlatform : NSObject

@property (nonatomic, copy) NSString *mapId;

@property (nonatomic, copy) NSString *appKey;

@property (nonatomic, copy) NSString *factoryName;

@property (nonatomic, copy) NSString *isOpen;


- (instancetype)initWithDict:(NSDictionary *)dict;

@end
