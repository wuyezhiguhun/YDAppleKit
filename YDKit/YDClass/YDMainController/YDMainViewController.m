//
//  YDMainViewController.m
//  YDKit
//
//  Created by 王允顶 on 2018/6/24.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDMainViewController.h"


@interface YDMainViewController ()<UITableViewDelegate, UITableViewDataSource, YDMultiLanguageChange>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *titleList;
@property (nonatomic, copy) NSArray *routerList;
@end

@implementation YDMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[YDMultiLanguageContainer shared] addLanguageChangeController:self];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"YDKit";
    
    [self.view addSubview:self.tableView];
    
    [[YDRouter shared] map:@"wuyezhiguhun/networking/block" toBlock:^id(NSDictionary *params) {
        NSLog(@"YDMainViewController ---* %@",params);
        return nil;
    }];
}

- (void)reloadUIWhenLanguageChange {
    self.titleList = @[YDLanguage(@"YDNetworkingModule"),YDLanguage(@"YDFactoryPattern"),YDLanguage(@"YDFactoryMap")];
    [self.tableView reloadData];
}
#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.titleList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableViewCell = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCell];
    }
    cell.textLabel.text = [self.titleList objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    UIViewController *viewController = [[YDRouter shared] matchController:[self.routerList objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark -- get 函数
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (NSArray *)titleList {
    if (!_titleList) {
        _titleList = @[YDLanguage(@"YDNetworkingModule"),YDLanguage(@"YDFactoryPattern"),YDLanguage(@"YDFactoryMap")];
    }
    return _titleList;
}
- (NSArray *)routerList {
    if (!_routerList) {
        _routerList = @[YDModuleRouterNetworkingUrl,YDModuleRouterFactoryUrl,YDModuleRouterFactoryMapUrl];
    }
    return _routerList;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
