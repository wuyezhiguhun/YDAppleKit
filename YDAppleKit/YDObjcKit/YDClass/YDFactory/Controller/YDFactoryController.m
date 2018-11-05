//
//  YDFactoryController.m
//  YDKit
//
//  Created by rowena on 2018/7/9.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDFactoryController.h"
#import "YDViewFactory.h"

@interface YDFactoryController ()

@end

@implementation YDFactoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavigationBack];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = YDLanguage(@"YDFactoryPattern");
    NSObject *factoryButton = [YDViewFactory getInstance:@"1"];
    
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSObject *factoryImageView = [YDViewFactory getInstance:@"2"];
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
