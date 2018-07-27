//
//  YDMapController.m
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDFactoryMapController.h"
#import "YDMapEngine.h"
#import "YDPoiSearchRequest.h"

@interface YDFactoryMapController ()<YDLocationServiceDelegate, YDMapPoiSearchDelegate>

@property (nonatomic, strong) UIButton *button;

/** 地图View */
@property (nonatomic, strong) UIView *mapView;

@property (nonatomic, strong) id<YDMapView> mapViewFactory;
@property (nonatomic, strong) id<YDMapFactory> factory;
@property (nonatomic, strong) id<YDLocationService> locationService;
@property (nonatomic, strong) id<YDMapPoiSearch> mapPoiSearch;

@end

@implementation YDFactoryMapController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavigationBack];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.button];
    [self addMapView];
//    [self initLocationService];
    
    //初始化POI搜索服务
    [self initPoiSearch];
    
    // Do any additional setup after loading the view.
}
//添加地图
- (void)addMapView {
    [[YDMapEngine shareInstance] initMap];
    self.factory = [[YDMapEngine shareInstance] getMapFactory];
    self.mapViewFactory = [self.factory getMapViewWithFrame:CGRectMake(0, 139, YDScreenWidth, YDScreenHeight - 139)];
    self.mapView = [self.mapViewFactory getView];
    [self.view addSubview:self.mapView];
}
//初始化定位服务
- (void)initLocationService {
    self.locationService = [self.factory getMapLocationService];
    [self.locationService startUserLocationService];
    [self.mapViewFactory showsUserLocation:NO];
    [self.mapViewFactory setUserTrackingModel:YDUserTrackingModeFollow];
    [self.mapViewFactory showsUserLocation:YES];
}
//初始化POI搜索服务
- (void)initPoiSearch {
    self.mapPoiSearch = [self.factory getMapPoiSearch];
    [self.mapViewFactory setSelectedAnnotationViewFront:YES];
    [self.mapPoiSearch setDelegate:self];
    id<YDMapPoiSearchRequest> request = [[YDPoiSearchRequest alloc] init];
    [request setCity:@"北京"];
    [request setKeyword:@"停车场"];
    [request setPageIndex:0];
    [request setPageSize:10];
    
    [self.mapPoiSearch setSearchOption:request];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.mapViewFactory viewWillAppear];
    [self.locationService setDelegate:self];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.mapViewFactory viewWillDisappear];
    [self.locationService setDelegate:nil];
    [self.locationService stopUserLocationService];
}
#pragma mark -- YDLocationServiceDelegate
- (void)didUpdateUserHeading:(id<YDUserLocation>)userLocation {
 //   [self.mapViewFactory updateLocationData:userLocation];
    NSLog(@"heading ---@ %@",[userLocation getHeading]);
}
- (void)didUpdateUserLocation:(id<YDUserLocation>)userLocation {
    [self.mapViewFactory updateLocationData:userLocation];
    NSLog(@"location ---@ %@",[userLocation getLocation]);
}
- (void)didFailToLocateUserWithError:(NSError *)error {
    NSLog(@"error ---@ %@",error);
}

#pragma mark -- YDMapPoiSearchDelegate
/**
 *返回POI搜索结果
 *@param poiResult 搜索结果列表
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiResul:(id<YDMapPoiSearchResponse>)poiResult errorCode:(YDMapSearchErrorCode)errorCode {
    
}

/**
 *返回POI详情搜索结果
 *@param poiDetailResult 详情搜索结果
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiDetailResult:(id<YDMapPoiDetailResult>)poiDetailResult errorCode:(YDMapSearchErrorCode)errorCode {
    
}

/**
 *返回POI室内搜索结果
 *@param poiIndoorResult 搜索结果列表
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiIndoorResult:(id<YDMapPoiIndoorResult>)poiIndoorResult errorCode:(YDMapSearchErrorCode)errorCode {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)buttonTouch {
    if ([YDMapEngine lookMapPlatformType] == YDMapPlatformBaidu) {
        [YDMapEngine setMapPlatformType:YDMapPlatformAmap];
        [self.button setTitle:@"切换百度地图" forState:UIControlStateNormal];
    } else {
        [YDMapEngine setMapPlatformType:YDMapPlatformBaidu];
        [self.button setTitle:@"切换高德地图" forState:UIControlStateNormal];
    }
    [self.mapView removeFromSuperview];
    self.mapView = nil;
    [self addMapView];
}
#pragma mark -- get 函数
- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(15, 64 + 15, YDScreenWidth - 30, 45)];
        _button.backgroundColor = [UIColor orangeColor];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        if ([YDMapEngine lookMapPlatformType] == YDMapPlatformBaidu) {
            [_button setTitle:@"切换高德地图" forState:UIControlStateNormal];
        } else {
            [_button setTitle:@"切换百度地图" forState:UIControlStateNormal];
        }
        [_button addTarget:self action:@selector(buttonTouch) forControlEvents:UIControlEventTouchUpInside];
        _button.layer.cornerRadius = 5.0;
        _button.layer.masksToBounds = YES;
    }
    return _button;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
