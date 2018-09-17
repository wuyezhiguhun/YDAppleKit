//
//  YDMVCItem.m
//  YDKit
//
//  Created by rowena on 2018/9/17.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDMVCItem.h"
@class YDMVCStore;
@class YDMVCFolder;

@interface YDMVCItem()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSUUID *uuid;
@property (nonatomic, weak) YDMVCStore *store;
@property (nonatomic, weak) YDMVCFolder *parent;

@end

@implementation YDMVCItem

- (instancetype)initName:(NSString *)name uuid:(NSUUID *)uuid {
    self = [super init];
    if (self) {
        self.name = name;
        self.uuid = uuid;
        self.store = nil;
    }
    return self;
}

- (void)setName:(NSString *)name {
    _name = name;
}

@end
