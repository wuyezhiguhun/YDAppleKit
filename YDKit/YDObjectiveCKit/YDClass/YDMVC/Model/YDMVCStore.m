//
//  YDMVCStore.m
//  YDKit
//
//  Created by rowena on 2018/9/17.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDMVCStore.h"
#import "YDMVCFolder.h"


@interface YDMVCStore()

@property (nonatomic, strong) NSURL *baseURL;
@property (nonatomic, strong) NSURL *placeholder;
@property (nonatomic, strong) NSURL *documentDirectory;
@property (nonatomic, copy) NSString *storeLocation;
@property (nonatomic, strong) YDMVCFolder *rootFolder;

@end

static NSString *changeNotification = @"YDMVCStoreChangedNotification";
//static NSURL *documentDirectory = [[NSFileManager defaultManager] URLForDirectory:NSLibraryDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];

@implementation YDMVCStore

static YDMVCStore *shared = nil;
+ (instancetype)sharedMVCStore {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *documentDirectory = [[NSFileManager defaultManager] URLForDirectory:NSLibraryDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        shared = [[YDMVCStore alloc] init:documentDirectory];
    });
    return shared;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (shared == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            shared = [super allocWithZone:zone];
        });
    }
    return shared;
}

- (instancetype)init:(NSURL *)url {
    self = [super init];
    if (self) {
        self.baseURL = url;
        self.placeholder = nil;
        if (url) {
            NSData *data = [[NSData alloc] initWithContentsOfURL:[url URLByAppendingPathComponent:self.storeLocation]];
        }
        
    }
    return self;
}

#pragma mark -- get 函数
- (NSString *)storeLocation {
    if (!_storeLocation) {
        _storeLocation = @"store.json";
    }
    return _storeLocation;
}

@end
