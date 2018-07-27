//
//  YDSingletonController.m
//  YDKit
//
//  Created by rowena on 2018/7/27.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDSingletonController.h"
#import "YDSingletonPattern.h"


@interface YDSingletonController ()

@end

@implementation YDSingletonController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavigationBack];
    self.navigationItem.title = YDLanguage(@"YDSingletonPattern");
    self.view.backgroundColor = YDColorHexAlpha(0xdddddd, 1.0);
    // Do any additional setup after loading the view.
    
    YDSingletonPattern *singleton1 = [YDSingletonPattern sharedInstance];
    YDSingletonPattern *singleton2 = [[YDSingletonPattern alloc] init];
    YDSingletonPattern *singleton3 = [YDSingletonPattern sharedInstance];
    YDSingletonPattern *singleton4 = [[YDSingletonPattern alloc] init];
    
    NSLog(@"\n\n***************** YDSingletonController *****************\n\n");
    NSLog(@"SingletonPattern1  *---* %@",singleton1);
    NSLog(@"SingletonPattern2  *---* %@",singleton2);
    NSLog(@"SingletonPattern3  *---* %@",singleton3);
    NSLog(@"SingletonPattern4  *---* %@",singleton4);
    NSLog(@"\n\n***************** YDSingletonController *****************\n\n");
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
