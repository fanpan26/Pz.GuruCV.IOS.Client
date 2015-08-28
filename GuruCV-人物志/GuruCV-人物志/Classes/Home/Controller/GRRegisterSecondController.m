//
//  GRRegisterSecondController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/25.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//  注册页面第二步

#import "GRRegisterSecondController.h"
#import "GRRegisterThirdController.h"
#import "GRCommonPwdTextField.h"
#import "GRCommonTextField.h"
#import "UIBarButtonItem+MJ.h"

@interface GRRegisterSecondController ()

@end

@implementation GRRegisterSecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

- (void) buildUI
{
    self.title = @"劳人记忆";
    //用户名
    GRCommonTextField *phoneText = [[GRCommonTextField alloc] init];
    phoneText.frame = CGRectMake(10, 80, 0, 0);
    phoneText.placeholder = @"验证码";
    [self.view addSubview:phoneText];
    //倒计时
    UIButton *timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    timeBtn.backgroundColor = [UIColor grayColor];
    [timeBtn setTitle:@"重新发送(60)" forState:UIControlStateNormal];
    [timeBtn.layer setMasksToBounds:YES];
    [timeBtn.layer setCornerRadius:10.0];//设置矩形四个圆角半径
    timeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [timeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CGFloat timeBtnX = CGRectGetMaxX(phoneText.frame) - 100;
    CGFloat timeBtnY = (phoneText.frame.size.height - 25) * 0.5;
    timeBtn.frame = CGRectMake(timeBtnX , timeBtnY, 80, 25);
    [phoneText addSubview:timeBtn];
    //密码
    GRCommonTextField *pwdText = [[GRCommonTextField alloc] init];
    pwdText.frame = CGRectMake(10, CGRectGetMaxY(phoneText.frame) + kLoginMargin, 0, 0);
    pwdText.placeholder = @"设置密码";
    [self.view addSubview:pwdText];
    //登录框
    UIButton *loginBtn = [[UIButton alloc] init];
    CGFloat loginBtnX = 10;
    CGFloat loginBtnY = CGRectGetMaxY(pwdText.frame) + kLoginMargin * 2;
    CGFloat loginBtnWidth = self.view.frame.size.width - 2 * loginBtnX;
    loginBtn.frame = CGRectMake(loginBtnX , loginBtnY, loginBtnWidth , 40);
    [loginBtn setTitle:@"注 册" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.backgroundColor = kColor(157,0,32);
    [loginBtn addTarget:self action:@selector(registerNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
}
/**
 *  跳转到注册页面下一步
 *
 *  @param btn
 */
- (void) registerNext
{
    GRRegisterThirdController *thirdRegister = [[GRRegisterThirdController alloc] init];
    thirdRegister.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_back.png" highlightedIcon:@"navigationbar_back_highlighted.png" target:self action:@selector(back)];
    
    [self.navigationController pushViewController:thirdRegister animated:YES];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
