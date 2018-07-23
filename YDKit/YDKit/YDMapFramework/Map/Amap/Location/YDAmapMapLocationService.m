//
//  YDAmapMapLocationService.m
//  YDKit
//
//  Created by rowena on 2018/7/19.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDAmapMapLocationService.h"
#import "YDAmapMapUserLocation.h"

@interface YDAmapMapLocationService()<AMapLocationManagerDelegate>

@property (nonatomic, strong) AMapLocationManager *locationManager;

@property (nonatomic, weak) id<YDLocationServiceDelegate> delegate;

@end

@implementation YDAmapMapLocationService

- (instancetype)init {
    self = [super init];
    if (self) {
        self.locationManager = [[AMapLocationManager alloc] init];
    }
    return self;
}

- (void)setDelegate:(id<YDLocationServiceDelegate>)delegate {
    _delegate = delegate;
    if (delegate == nil) {
        self.locationManager.delegate = nil;
    } else {
        self.locationManager.delegate = self;
    }
}

//启动定位
- (void)startUserLocationService {
    //位置定位
    [self.locationManager startUpdatingLocation];
    //方向定位
    [self.locationManager startUpdatingHeading];
}

//结束定位
- (void)stopUserLocationService {
    //位置定位
    [self.locationManager stopUpdatingLocation];
    //方向定位
    [self.locationManager stopUpdatingHeading];
}

//实现相关delegate 处理位置信息更新
#pragma mark -- AMapLocationManagerDelegate

/**
 *  @brief 当定位发生错误时，会调用代理的此方法。
 *  @param manager 定位 AMapLocationManager 类。
 *  @param error 返回的错误，参考 CLError 。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToLocateUserWithError:)]) {
        [self.delegate didFailToLocateUserWithError:error];
    }
}

/**
 *  @brief 设备方向改变时回调函数
 *  @param manager 定位 AMapLocationManager 类。
 *  @param newHeading 设备朝向。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didUpdateUserHeading:)]) {
        [self.delegate didUpdateUserHeading:[[YDAmapMapUserLocation alloc] initWithHeading:newHeading]];
    }

}

/**
 *  @brief 连续定位回调函数.注意：如果实现了本方法，则定位信息不会通过amapLocationManager:didUpdateLocation:方法回调。
 *  @param manager 定位 AMapLocationManager 类。
 *  @param location 定位结果。
 *  @param reGeocode 逆地理信息。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didUpdateUserLocation:)]) {
        [self.delegate didUpdateUserLocation:[[YDAmapMapUserLocation alloc] initWithLocation:location]];
    }
}




@end
