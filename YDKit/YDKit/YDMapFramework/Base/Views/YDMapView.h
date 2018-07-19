//
//  YDMapView.h
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YDUserLocation.h"

typedef NS_ENUM(NSInteger, YDUserTrackingMode) {
    /** 普通定位模式 */
    YDUserTrackingModeNone               = 0 ,
    /** 定位方向模式 */
    YDUserTrackingModeHeading            = 1 ,
    /** 定位跟随模式 */
    YDUserTrackingModeFollow             = 2 ,
    /** 定位罗盘模式 */
    YDUserTrackingModeFollowWithHeading  = 3
};

@protocol YDMapView <NSObject>

//返回地图视图（父类的引用指向子类的实例对象）
- (UIView *)getView;

//构造方法需要指定MapView大小
- (instancetype)initWithFrame:(CGRect)frame;

//显示定位图层
- (void)showsUserLocation:(BOOL)isShowUserLocation;

//更新定位图层
- (void)updateLocationData:(id<YDUserLocation>)userLocation;

//设置定位模式
- (void)setUserTrackingModel:(YDUserTrackingMode)mode;

//当mapview即将被显示的时候调用，恢复之前存储的mapview状态
- (void)viewWillAppear;

//当mapview即将被隐藏的时候调用，存储当前mapview的状态
- (void)viewWillDisappear;

@end
