//
//  YDBaiduMapLocationService.m
//  YDKit
//
//  Created by rowena on 2018/7/19.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDBaiduMapLocationService.h"
#import "YDBaiduMapUserLocation.h"
#import <BMKLocationkit/BMKLocationComponent.h>

//实现报读地图定位
@interface YDBaiduMapLocationService()<BMKLocationManagerDelegate>

@property (nonatomic, strong) BMKLocationManager *locationManager;

//@property (nonatomic, strong) BMKLocationService *locationService;

@property (nonatomic, weak) id<YDLocationServiceDelegate> delegate;

@end

@implementation YDBaiduMapLocationService

- (instancetype)init {
    self = [super init];
    if (self) {
//        self.locationService = [[BMKLocationService alloc] init];
        self.locationManager = [[BMKLocationManager alloc] init];
    }
    return self;
}

- (void)setDelegate:(id<YDLocationServiceDelegate>)delegate {
    _delegate = delegate;
    if (delegate == nil) {
        self.locationManager.delegate = nil;
//        self.locationService.delegate = nil;
    } else {
        self.locationManager.delegate = self;
//        self.locationService.delegate = self;
    }
}

//启动定位
- (void)startUserLocationService {
    [self.locationManager startUpdatingHeading];
    [self.locationManager startUpdatingLocation];
//    [self.locationService startUserLocationService];
}

//结束定位
- (void)stopUserLocationService {
    [self.locationManager stopUpdatingHeading];
    [self.locationManager stopUpdatingLocation];
//    [self.locationService stopUserLocationService];
}

//x实现相关delegate 处理位置信息更新
#pragma mark -- BMKLocationManagerDelegate
/**
 *  @brief 当定位发生错误时，会调用代理的此方法。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param error 返回的错误，参考 CLError 。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didFailWithError:(NSError * _Nullable)error {
    
}


/**
 *  @brief 连续定位回调函数。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param location 定位结果，参考BMKLocation。
 *  @param error 错误信息。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didUpdateLocation:(BMKLocation * _Nullable)location orError:(NSError * _Nullable)error {
    
}

/**
 *  @brief 定位权限状态改变时回调函数
 *  @param manager 定位 BMKLocationManager 类。
 *  @param status 定位权限状态。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
}


/**
 * @brief 该方法为BMKLocationManager提示需要设备校正回调方法。
 * @param manager 提供该定位结果的BMKLocationManager类的实例。
 */
- (BOOL)BMKLocationManagerShouldDisplayHeadingCalibration:(BMKLocationManager * _Nonnull)manager {
    return YES;
}

/**
 * @brief 该方法为BMKLocationManager提供设备朝向的回调方法。
 * @param manager 提供该定位结果的BMKLocationManager类的实例
 * @param heading 设备的朝向结果
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager
          didUpdateHeading:(CLHeading * _Nullable)heading {
    
}

/**
 * @brief 该方法为BMKLocationManager所在App系统网络状态改变的回调事件。
 * @param manager 提供该定位结果的BMKLocationManager类的实例
 * @param state 当前网络状态
 * @param error 错误信息
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager
     didUpdateNetworkState:(BMKLocationNetworkState)state orError:(NSError * _Nullable)error {
    
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
    if (self.delegate && [self.delegate respondsToSelector:@selector(didUpdateUserLocation:)]) {
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
