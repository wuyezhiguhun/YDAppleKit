//
//  YDBaiduAIController.m
//  YDAppleKit
//
//  Created by rowena on 2018/10/23.
//  Copyright © 2018年 wuyezhiguhun. All rights reserved.
//

#import "YDBaiduAIController.h"
#import "YDBaiduAiAuthNet.h"
#import "YDBaiduAiAuthInfo.h"

@interface YDBaiduAIController ()<YDBaiduAiAuthNetDelegate>

@property (nonatomic, strong) YDBaiduAiAuthNet *baiduAiAuthNet;

@end

@implementation YDBaiduAIController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
    
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.baiduAiAuthNet baiduAiAuthBaidubceNet];
    
}

/**
 * 设置导航栏
 */
- (void)setNavigationItem {
    [self addNavigationBack];
    self.navigationItem.title = YDLanguage(@"YDBaiduAI");
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark -- YDBaiduAiAuthNetDelegate
- (void)baiduAiAuthNetStart {
    
}
- (void)baiduAiAuthNetSuccess:(NSDictionary *)success {
    YDBaiduAiAuthInfo *baiduAiAuthInfo = [YDBaiduAiAuthInfo alloc];
    
    [YDLog i:[NSString stringWithFormat:@":<- access_token ->:  -- %@",baiduAiAuthInfo.access_token]];
    [YDLog i:[NSString stringWithFormat:@":<- refresh_token ->:  --  %@",baiduAiAuthInfo.refresh_token]];
     
}
- (void)baiduAiAuthNetFailure:(NSString *)failure {
    
}

#pragma mark -- get 函数
- (YDBaiduAiAuthNet *)baiduAiAuthNet {
    if (!_baiduAiAuthNet) {
        _baiduAiAuthNet = [[YDBaiduAiAuthNet alloc] init];
        _baiduAiAuthNet.delegate = self;
    }
    return _baiduAiAuthNet;
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
