//
//  GRLoginController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/24.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRLoginController.h"
#import "GRCommonTextField.h"
#import "GRCommonPwdTextField.h"
#import "GRForgetPwdFirstController.h"
#import "UIBarButtonItem+MJ.h"



@interface GRLoginController ()

@end

@implementation GRLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

/**
 *  添加控件
 */
- (void) buildUI
{
    self.title = @"登  录";
    //用户名
    GRCommonTextField *phoneText = [[GRCommonTextField alloc] init];
    phoneText.frame = CGRectMake(10, 80, 0, 0);
    phoneText.placeholder = @"手机号";
    phoneText.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:phoneText];
    //密码
    GRCommonPwdTextField *pwdText = [[GRCommonPwdTextField alloc] init];
    pwdText.frame = CGRectMake(10, CGRectGetMaxY(phoneText.frame) + kLoginMargin, 0, 0);
    pwdText.placeholder = @"密码";
    pwdText.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:pwdText];
    //登录框
    UIButton *loginBtn = [[UIButton alloc] init];
    CGFloat loginBtnX = 10;
    CGFloat loginBtnY = CGRectGetMaxY(pwdText.frame) + kLoginMargin * 2;
    CGFloat loginBtnWidth = self.view.frame.size.width - 2 * loginBtnX;
    loginBtn.frame = CGRectMake(loginBtnX , loginBtnY, loginBtnWidth , 40);
    [loginBtn setTitle:@"登 录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.backgroundColor = kColor(157,0,32);
    [self.view addSubview:loginBtn];
    
    //忘记密码
    UIButton *forgetPwd = [[UIButton alloc] init];
    [forgetPwd setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgetPwd setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    forgetPwd.titleLabel.font = [UIFont systemFontOfSize:12];
    CGFloat forgetPwdX = self.view.center.x + self.view.center.x - 90;
    forgetPwd.frame = CGRectMake(forgetPwdX, CGRectGetMaxY(loginBtn.frame) + kLoginMargin, 100, 30);
    [forgetPwd addTarget:self action:@selector(forgetPwd:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPwd];
    
}

/**
 *  跳转到忘记密码页面
 *
 *  @param btn <#btn description#>
 */
- (void) forgetPwd:(UIButton *)btn
{
    GRForgetPwdFirstController *firstPwd = [[GRForgetPwdFirstController alloc] init];
    firstPwd.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_back.png" highlightedIcon:@"navigationbar_back_highlighted.png" target:self action:@selector(back)];

    [self.navigationController pushViewController:firstPwd animated:YES];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
