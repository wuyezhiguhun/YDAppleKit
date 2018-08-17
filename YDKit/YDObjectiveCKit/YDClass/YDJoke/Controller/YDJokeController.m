//
//  YDJokeController.m
//  YDKit
//
//  Created by 王允顶 on 2018/8/14.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDJokeController.h"
#import "YDJokeTableViewCell.h"
#import "YDJokeNetworking.h"

@interface YDJokeController ()<UITableViewDelegate, UITableViewDataSource, YDJokeNetworkingDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) YDJokeNetworking *jokeNetworking;

@end

@implementation YDJokeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = YDLanguage(@"YDJokeDaquan");
    [self addNavigationBack];
    [self.view addSubview:self.tableView];
    [self.jokeNetworking getJokeWithPageNum:1 pageSize:20];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- YDJokeNetworkingDelegate
- (void)jokeNetworkingStart {
    
}
- (void)jokeNetworkingSuccess:(NSArray *)success {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.dataList addObjectsFromArray:success];
        
        [self.tableView reloadData];
    });
    
}
- (void)jokeNetworkingFailure:(NSArray *)failure {
    
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *jokeTableViewCell = @"YDJokeTableViewCell";
    YDJokeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:jokeTableViewCell];
    if (!cell) {
        cell = [[YDJokeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:jokeTableViewCell];
    }
    int random = arc4random() % 14;
    NSString *imageName = [NSString stringWithFormat:@"anime-%02d",random];
    cell.iconImageView.image = [UIImage imageNamed:imageName];
    cell.jokeLabel.text = [self.dataList objectAtIndex:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *content = [self.dataList objectAtIndex:indexPath.row];
    CGFloat height = [content boundingRectWithSize:CGSizeMake(YDScreenWidth - 145, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height + 20;
    if (height < 130) {
        return 130;
    } else {
        return height;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark -- get 函数
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (NSMutableArray *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}
- (YDJokeNetworking *)jokeNetworking {
    if (!_jokeNetworking) {
        _jokeNetworking = [[YDJokeNetworking alloc] init];
        _jokeNetworking.delegate = self;
    }
    return _jokeNetworking;
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
