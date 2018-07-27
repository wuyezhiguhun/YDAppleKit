//
//  YDBaiduMapPoiInfo.m
//  YDKit
//
//  Created by rowena on 2018/7/24.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDBaiduMapPoiInfo.h"

@interface YDBaiduMapPoiInfo ()

@property (nonatomic, strong) BMKPoiInfo *poiInfo;

@end

@implementation YDBaiduMapPoiInfo

- (instancetype)initWithPoiInfo:(BMKPoiInfo *)poiInfo {
    self = [super init];
    if (self) {
        self.poiInfo = poiInfo;
    }
    return self;
}


/// POI名称
- (NSString *)getName {
    return self.poiInfo.name;
}
/// POI坐标
- (CLLocationCoordinate2D)getPt {
    return self.poiInfo.pt;
}
/// POI地址信息
- (NSString *)getAddress {
    return self.poiInfo.address;
}
/// POI电话号码
- (NSString *)getPhone {
    return self.poiInfo.phone;
}
/// POI唯一标识符uid
- (NSString *)getUID {
    return self.poiInfo.UID;
}
/// POI所在省份
- (NSString *)getProvince {
    return self.poiInfo.province;
}
/// POI所在城市
- (NSString *)getCity {
    return self.poiInfo.city;
}
/// POI所在行政区域
- (NSString *)getArea {
    return self.poiInfo.area;
}
/// POI对应的街景图ID
- (NSString *)getStreetID {
    return self.poiInfo.streetID;
}
/// POI是否有详情信息
- (BOOL)getHasDetailInfo {
    return self.poiInfo.hasDetailInfo;
}

@end
