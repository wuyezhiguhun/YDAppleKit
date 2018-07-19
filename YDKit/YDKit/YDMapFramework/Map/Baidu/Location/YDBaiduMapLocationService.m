//
//  YDBaiduMapLocationService.m
//  YDKit
//
//  Created by rowena on 2018/7/19.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDBaiduMapLocationService.h"
#import "YDBaiduMapUserLocation.h"

//实现报读地图定位
@interface YDBaiduMapLocationService()<BMKLocationServiceDelegate>

@property (nonatomic, strong) BMKLocationService *locationService;

@property (nonatomic, strong) id<YDLocationServiceDelegate> delegate;

@end

@implementation YDBaiduMapLocationService

- (instancetype)init {
    self = [super init];
    if (self) {
        self.locationService = [[BMKLocationService alloc] init];
    }
    return self;
}

- (void)setDelegate:(id<YDLocationServiceDelegate>)delegate {
    _delegate = delegate;
    if (delegate == nil) {
        self.locationService.delegate = nil;
    } else {
        self.locationService.delegate = self;
    }
}

//启动定位
- (void)startUserLocationService {
    [self.locationService startUserLocationService];
}

//结束定位
- (void)stopUserLocationService {
    [self.locationService stopUserLocationService];
}

//实现相关delegate 处理位置信息更新
#pragma mark -- BMKLocationServiceDelegate
//处理方向变更信息
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didUpdateUserHeading:)]) {
        [self.delegate didUpdateUserHeading:[[YDBaiduMapUserLocation alloc] initWithUserLocation:userLocation]];
    }
}
//位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didUpdateBMKUserLocation:)]) {
        [self.delegate didUpdateUserLocation:[[YDBaiduMapUserLocation alloc] initWithUserLocation:userLocation]];
    }
}

//定位失败后，回调此函数
- (void)didFailToLocateUserWithError:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToLocateUserWithError:)]) {
        [self.delegate didFailToLocateUserWithError:error];
    }
}

@end
