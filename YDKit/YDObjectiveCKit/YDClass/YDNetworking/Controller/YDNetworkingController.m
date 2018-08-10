//
//  YDNetworkingController.m
//  YDKit
//
//  Created by rowena on 2018/6/26.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDNetworkingController.h"
#import "YDRouter.h"

@interface YDNetworkingController ()

@end

@implementation YDNetworkingController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavigationBack];
    self.navigationItem.title = YDLanguage(@"YDNetworkingModule");
    self.view.backgroundColor = [UIColor orangeColor];
    
    NSLog(@"YDNetworkingController ---* %@",self.params);
    

    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[YDRouter shared] callBlock: @"wuyezhiguhun/networking/block?title=宝塔镇河妖"];
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
