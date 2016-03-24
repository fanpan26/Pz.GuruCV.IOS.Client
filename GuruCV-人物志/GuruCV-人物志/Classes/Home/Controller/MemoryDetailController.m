//
//  MemoryDetailController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/20.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
// 活动详细页面的controller

#import "MemoryDetailController.h"
#import "GRBottomBar.h"

@implementation MemoryDetailController

- (instancetype)init
{
    if (self = [super init]) {
        [self buildUI];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"劳人记忆";
    NSLog(@"ViewDidLoad");
    [self buildUI];
}

- (void) buildUI
{
    GRBottomBar *bar = [[GRBottomBar alloc] init];
    bar.frame = CGRectMake(0, 80, self.view.frame.size.width, 0);
    [bar addItem:@"报名" icon:@"icon_comment"];
    [bar addItem:@"喜欢" icon:@"icon_like"];
    [bar addItem:@"报名" icon:@"icon_comment"];
    [bar addItem:@"喜欢" icon:@"icon_like"];
    [bar addItem:@"报名" icon:@"icon_comment"];
    [self.view addSubview:bar];
//    UIImageView *photo = [[UIImageView alloc] init];
//    [self.view addSubview:photo];
//    
//    UILabel *username = [[UILabel alloc] init];
//    [self.view addSubview:username];
//    
//    UILabel *company = [[UILabel alloc] init];
//    [self.view addSubview:company];
//    
//    UILabel *postion = [[UILabel alloc] init];
//    [self.view addSubview:postion];
//    
//    UILabel *time = [[UILabel alloc] init];
//    [self.view addSubview:time];
}

@end
