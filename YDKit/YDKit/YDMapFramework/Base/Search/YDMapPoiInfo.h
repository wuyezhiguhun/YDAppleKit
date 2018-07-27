//
//  YDMapPoiInfo.h
//  YDKit
//
//  Created by rowena on 2018/7/23.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


//FOI搜索列表
@protocol YDMapPoiInfo <NSObject>

/// POI名称
- (NSString *)getName;
/// POI坐标
- (CLLocationCoordinate2D)getPt;
/// POI地址信息
- (NSString *)getAddress;
/// POI电话号码
- (NSString *)getPhone;
/// POI唯一标识符uid
- (NSString *)getUID;
/// POI所在省份
- (NSString *)getProvince;
/// POI所在城市
- (NSString *)getCity;
/// POI所在行政区域
- (NSString *)getArea;
/// POI对应的街景图ID
- (NSString *)getStreetID;
/// POI是否有详情信息
- (BOOL)getHasDetailInfo;
/// POI详情信息
//- (id<YDMapPoiDetailResult>)getDetailInfo;

@end
