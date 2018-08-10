//
//  YDWebViewController.m
//  YDKit
//
//  Created by rowena on 2018/8/9.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDWebViewController.h"
#import <WebKit/WebKit.h>

@interface YDWebViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation YDWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self.view addSubview:self.textField];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITextFieldDelegate


#pragma mark -- get 函数
- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64 + 70, YDScreenWidth, self.view.bounds.size.height - 70 - 64)];
        NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }
    return _webView;
}
- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 64 + 15, YDScreenWidth - 30, 40)];
        _textField.delegate = self;
        _textField.keyboardType = UIKeyboardTypeASCIICapable;
        _textField.layer.borderColor = [UIColor grayColor].CGColor;
        _textField.layer.borderWidth = 1.0;
        _textField.layer.cornerRadius = 5.0;
        _textField.layer.masksToBounds = YES;
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
        _textField.leftView = leftView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.clearButtonMode = UITextFieldViewModeAlways;
    }
    return _textField;
}


@end
