//
//  GRForgetPwdFirstController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/24.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRForgetPwdFirstController.h"
#import "GRCommonPwdTextField.h"
#import "GRCommonTextField.h"
#import "GRForgetPwdSecondController.h"
#import "UIBarButtonItem+MJ.h"

@interface GRForgetPwdFirstController ()

@end

@implementation GRForgetPwdFirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

- (void) buildUI
{
    self.title = @"找回密码";
    
    //用户名
    GRCommonTextField *phoneText = [[GRCommonTextField alloc] init];
    phoneText.frame = CGRectMake(10, 80, 0, 0);
    phoneText.placeholder = @"手机号";
    phoneText.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:phoneText];
    //登录框
    UIButton *loginBtn = [[UIButton alloc] init];
    CGFloat loginBtnX = 10;
    CGFloat loginBtnY = CGRectGetMaxY(phoneText.frame) + kLoginMargin * 2;
    CGFloat loginBtnWidth = self.view.frame.size.width - 2 * loginBtnX;
    loginBtn.frame = CGRectMake(loginBtnX , loginBtnY, loginBtnWidth , 40);
    [loginBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.backgroundColor = kColor(157,0,32);
    [loginBtn addTarget:self action:@selector(forgetPwdToSecond) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    //忘记密码
    UIButton *forgetPwd = [[UIButton alloc] init];
    [forgetPwd setTitle:@"返回登录" forState:UIControlStateNormal];
    [forgetPwd setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    forgetPwd.titleLabel.font = [UIFont systemFontOfSize:12];
    CGFloat forgetPwdX = self.view.center.x + self.view.center.x - 90;
    forgetPwd.frame = CGRectMake(forgetPwdX, CGRectGetMaxY(loginBtn.frame) + kLoginMargin, 100, 30);
    [forgetPwd addTarget:self action:@selector(returnLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPwd];
}

//跳转到验证码页面
- (void)forgetPwdToSecond
{
    GRForgetPwdSecondController *second = [[GRForgetPwdSecondController alloc] init];
     second.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_back.png" highlightedIcon:@"navigationbar_back_highlighted.png" target:self action:@selector(back)];
    [self.navigationController pushViewController:second animated:YES];
}

//返回到login页面
- (void)returnLogin:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
