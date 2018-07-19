//
//  YDMapController.m
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDFactoryMapController.h"
#import "YDMapEngine.h"

@interface YDFactoryMapController ()<YDLocationServiceDelegate>

@property (nonatomic, strong) UIButton *button;

/** 地图View */
@property (nonatomic, strong) UIView *mapView;

@property (nonatomic, strong) id<YDMapView> mapViewFactory;
@property (nonatomic, strong) id<YDMapFactory> factory;
@property (nonatomic, strong) id<YDLocationService> locationService;

@end

@implementation YDFactoryMapController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.button];
    [self addMapView];
    [self initLocationService];
    
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
- (void)initLocationService {
    self.locationService = [self.factory getMapLocationService];
    [self.locationService startUserLocationService];
    [self.mapViewFactory showsUserLocation:NO];
    [self.mapViewFactory setUserTrackingModel:YDUserTrackingModeNone];
    [self.mapViewFactory showsUserLocation:YES];
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
    
}
- (void)didUpdateUserLocation:(id<YDUserLocation>)userLocation {
    
}
- (void)didFailToLocateUserWithError:(NSError *)error {
    
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
