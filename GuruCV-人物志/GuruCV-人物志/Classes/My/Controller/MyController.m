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
#import "GRMyCardTopView.h"
#import "GRUserPeople.h"
#import "GRMyCardBottomBarView.h"


@interface MyController()<GRMyCardBottomBarViewDeletage>

@end
@implementation MyController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我的";
    self.view.backgroundColor = kGlobalBackGroundViewColor;
    [self buildUI];
}

- (void)buildUI
{
   // [self.navigationController setNavigationBarHidden:YES];
    GRMyCardTopView *view = [[GRMyCardTopView alloc] init];
    view.frame = CGRectMake(0, 0, 0, 0);
    GRUserPeople *model = [[GRUserPeople alloc] init];
    view.userModel  = model;
    view.bottonBar.delegate = self;
    [self.view addSubview:view];
}

- (void)jump
{
    
    UserCardController *userCard = [[UserCardController alloc] init];
    [self.navigationController pushViewController:userCard animated:YES];
    
}

-(void)myCardView:(GRMyCardBottomBarView *)myCardView didClickedBarItem:(UIButton *)item
{
    if (item.tag == 1) {
        [self jump];
    }
}
@end
