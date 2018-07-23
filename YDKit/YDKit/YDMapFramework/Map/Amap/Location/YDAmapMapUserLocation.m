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

@property (nonatomic, strong) CLHeading *userHeading;

@property (nonatomic, strong) CLLocation *amapLocation;

@end

@implementation YDAmapMapUserLocation

- (instancetype)initWithUserLocation:(MAUserLocation *)userLocation {
    self = [super init];
    if (self) {
        self.userLocation = userLocation;
    }
    return self;
}

- (instancetype)initWithHeading:(CLHeading *)userHeading {
    self = [super init];
    if (self) {
        self.userHeading = userHeading;
    }
    return self;
}

- (instancetype)initWithLocation:(CLLocation *)userLocation {
    self = [super init];
    if (self) {
        self.amapLocation = userLocation;
    }
    return self;
}

//返回指定的定位数据
- (id)getObject {
    return nil;
}

/// 位置更新状态，如果正在更新位置信息，则该值为YES
- (BOOL)isUpdating {
    return YES;
}

/// 位置信息，尚未定位成功，则该值为nil
- (CLLocation *)getLocation {
    return self.amapLocation;
}

/// heading信息，尚未定位成功，则该值为nil
- (CLHeading *)getHeading {
    return self.userHeading;
}

/// 定位标注点要显示的标题信息
- (NSString *)getTitle {
    return nil;
}

/// 定位标注点要显示的子标题信息.
- (NSString *)getSubtitle {
    return nil;
}

@end
