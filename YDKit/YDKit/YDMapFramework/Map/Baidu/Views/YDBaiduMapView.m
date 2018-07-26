//
//  YDBaiduMapView.m
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDBaiduMapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface YDBaiduMapView()

@property (nonatomic, strong) BMKMapView *mapView;

@end

@implementation YDBaiduMapView

//专门用于实现百度地图
//初始化百度地图
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        self.mapView = [[BMKMapView alloc] initWithFrame:frame];
    }
    return self;
}

- (UIView *)getView {
    return self.mapView;
}


//显示定位图层
- (void)showsUserLocation:(BOOL)isShowUserLocation {
    self.mapView.showsUserLocation = isShowUserLocation;
}

//更新定位图层
- (void)updateLocationData:(id<YDUserLocation>)userLocation {
    [self.mapView updateLocationData:[userLocation getObject]];
}

//设置定位模式
- (void)setUserTrackingModel:(YDUserTrackingMode)mode {
    switch (mode) {
        case YDUserTrackingModeNone:
            self.mapView.userTrackingMode = BMKUserTrackingModeNone;
            break;
        case YDUserTrackingModeFollow:
            self.mapView.userTrackingMode = BMKUserTrackingModeFollow;
            break;
        case YDUserTrackingModeHeading:
            self.mapView.userTrackingMode = BMKUserTrackingModeHeading;
            break;
        case YDUserTrackingModeFollowWithHeading:
            self.mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;
            break;
            
        default:
            break;
    }
}

//设定是否总让选中的annotation置于最前面
- (void)setSelectedAnnotationViewFront:(BOOL)isSwlwctedAnnotationViewFront {
    self.mapView.isSelectedAnnotationViewFront = isSwlwctedAnnotationViewFront;
}

//当mapview即将被显示的时候调用，恢复之前存储的mapview状态
- (void)viewWillAppear {
    [self.mapView viewWillAppear];
}

//当mapview即将被隐藏的时候调用，存储当前mapview的状态
- (void)viewWillDisappear {
    [self.mapView viewWillDisappear];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
