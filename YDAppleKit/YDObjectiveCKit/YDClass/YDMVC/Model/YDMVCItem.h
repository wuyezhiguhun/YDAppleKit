//
//  YDMVCItem.h
//  YDKit
//
//  Created by rowena on 2018/9/17.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDMVCItem : NSObject

@property (nonatomic, strong) NSUUID *uuid;

- (instancetype)initName:(NSString *)name uuid:(NSUUID *)uuid;

- (void)setName:(NSString *)name;

- (void)deleted;

- (YDMVCItem *)itemAtUUIDPath:(NSArray *)path;


@end
