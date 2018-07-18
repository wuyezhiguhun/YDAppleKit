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
    self = [super initWithFrame:frame];
    if (self) {
        self.mapView = [[BMKMapView alloc] initWithFrame:frame];
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
