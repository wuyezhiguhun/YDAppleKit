//
//  YDJokeController.m
//  YDKit
//
//  Created by 王允顶 on 2018/8/14.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDJokeController.h"
#import "YDJokeTableViewCell.h"

@interface YDJokeController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation YDJokeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = YDLanguage(@"YDJokeDaquan");
    [self addNavigationBack];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
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
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}
#pragma mark -- get 函数
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
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
