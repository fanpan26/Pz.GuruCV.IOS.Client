//
//  GRMyCardTopView.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/28.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GRMyCardTopFrame;
@class GRUserPeople;
@class GRMyCardBottomBarView;

@interface GRMyCardTopView : UIView

@property(nonatomic,strong) GRUserPeople *userModel;

@property(nonatomic,strong) GRMyCardBottomBarView *bottonBar;
@end
