//
//  YDAmapMapUserLocation.m
//  YDKit
//
//  Created by rowena on 2018/7/19.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDAmapMapUserLocation.h"

@interface YDAmapMapUserLocation()

@property (nonatomic, strong) MAUserLocation *userLocation;

@end

@implementation YDAmapMapUserLocation

- (instancetype)initWithUserLocation:(MAUserLocation *)userLocation {
    self = [super init];
    if (self) {
        self.userLocation = userLocation;
    }
    return self;
}

- (instancetype)initWithHeading:(CLHeading *)newHeading {
    self = [super init];
    if (self) {
        self.userLocation = [[MAUserLocation alloc] init];
    }
    return self;
}

//返回指定的定位数据
- (id)getObject {
    return self.userLocation;
}

/// 位置更新状态，如果正在更新位置信息，则该值为YES
- (BOOL)isUpdating {
    return self.userLocation.updating;
}

/// 位置信息，尚未定位成功，则该值为nil
- (CLLocation *)getLocation {
    return self.userLocation.location;
}

/// heading信息，尚未定位成功，则该值为nil
- (CLHeading *)getHeading {
    return self.userLocation.heading;
}

/// 定位标注点要显示的标题信息
- (NSString *)getTitle {
    return self.userLocation.title;
}

/// 定位标注点要显示的子标题信息.
- (NSString *)getSubtitle {
    return self.userLocation.subtitle;
}

@end
