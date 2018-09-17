//
//  YDMVCController.m
//  YDKit
//
//  Created by rowena on 2018/9/17.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDMVCController.h"
#import "YDMVCRecordingCell.h"
#import "YDMVCFolderCell.h"

@interface YDMVCController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NSInteger row;

@end

static NSString *mvcRecordingCell = @"YDMVCRecordingCell";
static NSString *mvcFolderCell = @"YDMVCFolderCell";

@implementation YDMVCController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.row = 5;
    [self.tableView registerClass:[YDMVCFolderCell class] forCellReuseIdentifier:mvcFolderCell];
    [self.tableView registerClass:[YDMVCRecordingCell class] forCellReuseIdentifier:mvcRecordingCell];
    [self setNavigationItem];

    // Do any additional setup after loading the view.
}

/**
 * 设置导航栏BarButtonItem
 */
- (void)setNavigationItem {
    self.navigationItem.title = @"MVC架构";
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBarButtonItemTouch)];
    UIBarButtonItem *organizeItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(organizeBarButtonItemTouch)];
    self.navigationItem.rightBarButtonItems = @[addItem, organizeItem];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"base_back_24"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(navigationBackTouch)];
    self.navigationItem.leftBarButtonItems = @[backItem,self.editButtonItem];
}

/*
 * 添加所有的View
 **/
- (void)addAllChildViews {
//    [self.view addSubview:self.homeView];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.row;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mvcFolderCell];
    cell.textLabel.text = @"  MVC构架";
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    self.row-- ;
}

#pragma mark -- 通知
- (void)handleChangeNotification:(NSNotification *)notification {
    
}
#pragma mark -- 导航栏上按钮点击事件
- (void)addBarButtonItemTouch {
    
}
- (void)organizeBarButtonItemTouch {
    
}

- (void)navigationBackTouch {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- get 函数


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
