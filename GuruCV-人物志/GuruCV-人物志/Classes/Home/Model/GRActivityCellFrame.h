//
//  GRActivityCellFrame.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/22.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GRUser.h"
#import "GRActivityModel.h"

@interface GRActivityCellFrame : NSObject

@property(nonatomic,strong) GRActivityModel *activity;

@property(nonatomic,assign,readonly) CGRect frameUserView;
@property(nonatomic,assign,readonly) CGRect frameUserPhoto;
@property(nonatomic,assign,readonly) CGRect frameUserName;
@property(nonatomic,assign,readonly) CGRect frameUserCompany;
@property(nonatomic,assign,readonly) CGRect frameUserPosition;
@property(nonatomic,assign,readonly) CGRect frameActivityIcon;
@property(nonatomic,assign,readonly) CGRect frameActivityTitle;
@property(nonatomic,assign,readonly) CGRect frameActivityCreateTime;
@property(nonatomic,assign,readonly) CGRect frameActivityBottomBar;


@property(nonatomic,assign,readonly) CGFloat cellHeight;
@end
