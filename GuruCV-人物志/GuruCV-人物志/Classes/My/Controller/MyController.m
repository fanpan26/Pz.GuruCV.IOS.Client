//
//  MyController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/19.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "MyController.h"
#import "UserCardController.h"
#import "MemoryDetailController.h"

@implementation MyController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我的";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget: self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 200, 200);
    [btn setTitle:@"查看我的名片" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)jump
{
    
    UserCardController *userCard = [[UserCardController alloc] init];
    [self.navigationController pushViewController:userCard animated:YES];
    
}
@end
