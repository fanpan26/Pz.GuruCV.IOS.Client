//
//  GRRegisterFirstController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/25.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//  注册页面第一步

#import "GRRegisterFirstController.h"
#import "GRRegisterSecondController.h"
#import "GRCommonTextField.h"
#import "UIBarButtonItem+MJ.h"
#import "GRSelectUserCategoryView.h"

@interface GRRegisterFirstController ()

@end

@implementation GRRegisterFirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}



/**
 *  添加控件
 */
- (void) buildUI
{
    self.title = @"劳人记忆";
    
    //选择框
    
    GRSelectUserCategoryView *selectView = [[GRSelectUserCategoryView alloc] init];
    selectView.frame = CGRectMake(10, 80, 0, 0);
    [self.view addSubview:selectView];
    //用户名
    GRCommonTextField *phoneText = [[GRCommonTextField alloc] init];
    phoneText.frame = CGRectMake(10, CGRectGetMaxY(selectView.frame) + 20, 0, 0);
    phoneText.placeholder = @"手机号";
    phoneText.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:phoneText];
    //登录框
    UIButton *nextBtn = [[UIButton alloc] init];
    CGFloat loginBtnX = 10;
    CGFloat loginBtnY = CGRectGetMaxY(phoneText.frame) + kLoginMargin * 4;
    CGFloat loginBtnWidth = self.view.frame.size.width - 2 * loginBtnX;
    nextBtn.frame = CGRectMake(loginBtnX , loginBtnY, loginBtnWidth , 40);
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextBtn.backgroundColor = kColor(157,0,32);
    [nextBtn addTarget:self action:@selector(registerNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    
}

/**
 *  跳转到注册页面下一步
 *
 *  @param btn
 */
- (void) registerNext
{
    GRRegisterSecondController *secondRegister = [[GRRegisterSecondController alloc] init];
    secondRegister.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_back.png" highlightedIcon:@"navigationbar_back_highlighted.png" target:self action:@selector(back)];
    
    [self.navigationController pushViewController:secondRegister animated:YES];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
