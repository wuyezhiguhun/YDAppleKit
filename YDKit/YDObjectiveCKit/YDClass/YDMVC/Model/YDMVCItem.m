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

@property (nonatomic, weak) YDMVCStore *store;
@property (nonatomic, weak) YDMVCFolder *parent;
@property (nonatomic, strong) NSUUID *uuidPath;

@end

static NSString *YDMVCChangeReasonKey = @"reason";
static NSString *YDMVCNewValueKey = @"newValue";
static NSString *YDMVCOldValueKey = @"oldValue";
static NSString *YDMVCParentFolderKey = @"parentFolder";
static NSString *YDMVCRenamed = @"renamed";
static NSString *YDMVCAdded = @"added";
static NSString *YDMVCRemoved = @"removed";

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

- (void)deleted {
    self.parent = nil;
}

- (YDMVCItem *)itemAtUUIDPath:(NSArray *)path {
    NSUUID *first = path.firstObject;
    if (first != self.uuid) {
        return nil;
    }
    
    return self;
}





@end
