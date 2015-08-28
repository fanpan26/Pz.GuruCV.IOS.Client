//
//  MemoryDetailController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/20.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
// 活动详细页面的controller

#import "MemoryDetailController.h"

@implementation MemoryDetailController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"劳人记忆";
   // self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.view.backgroundColor = [UIColor grayColor];
}

@end
