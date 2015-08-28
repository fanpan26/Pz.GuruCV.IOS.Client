//
//  GRActivityCell.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/22.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "BaseCell.h"
#import "GRActivityBottomBar.h"
#import "GRActivityCellFrame.h"

@interface GRActivityCell : BaseCell
//第一行内容
@property(nonatomic,weak,readonly)UIImageView *contentUserPhoto;
@property(nonatomic,weak,readonly)UIImageView *contentUserView;
@property(nonatomic,weak,readonly)UILabel *contentUserName;
@property(nonatomic,weak,readonly)UILabel *contentUserCompany;
@property(nonatomic,weak,readonly)UILabel *contentUserPosition;
//活动内容
@property(nonatomic,weak,readonly)UIImageView *contentActivityIcon;
@property(nonatomic,weak,readonly)UILabel *contentActivityTitle;
@property(nonatomic,weak,readonly)UILabel *contentActivityCreateTime;
//底部操作条，根据不同的文章类型，操作条是不一样的
@property(nonatomic,weak,readonly)GRActivityBottomBar *contentActivityBottomBar;

//frame
@property(nonatomic,strong) GRActivityCellFrame *cellFrame;
@end
