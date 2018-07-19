//
//  YDAmapMapView.m
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDAmapMapView.h"
#import <AMap2DMap-NO-IDFA/MAMapKit/MAMapView.h>

@interface YDAmapMapView()

@property (nonatomic, strong) MAMapView *mapView;

@end

@implementation YDAmapMapView

//专门用于实现百度地图
//初始化百度地图
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        self.mapView = [[MAMapView alloc] initWithFrame:frame];
    }
    return self;
}

- (UIView *)getView {
    return self.mapView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
