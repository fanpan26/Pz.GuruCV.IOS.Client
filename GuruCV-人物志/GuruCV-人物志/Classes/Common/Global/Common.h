//
//  Common.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/19.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

//距离状态栏间距
#define kTopMargin 20

//tableview背景色
#define kGlobalBackGroundColor kColor(232,233,232)

#define kGlobalBackGroundViewColor kColor(244,244,244)
//屏幕宽度
#define kScreenWidth [UIScreen mainScreen].applicationFrame.size.width
#define kScreenHeight [UIScreen mainScreen].applicationFrame.size.height;

//dock高度
#define  kDockHeight 44

// 5.获得RGB颜色
#define kColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define kDockItemSelectedColor kColor(16,97,224)

#define kDockItemNormalColor kColor(123,123,123)

//界面操作栏目字体设置

#define kBarButtonItemFont [UIFont systemFontOfSize:12]

//首页cell相关 活动列表
#define kActivityTableBorderMargin 5
#define kActivityCellHorizontalMargin 10//横向间距
#define kActivityCellVertialMargin 8    //竖向间距
#define kActivityUserFont [UIFont systemFontOfSize:12]
#define kActivityTitleFont [UIFont systemFontOfSize:14]
#define kActivityUserInfoColor kColor(129,129,129)

//登录相关
#define kLoginMargin 10

#define kBusinessCommonFont [UIFont systemFontOfSize:12]

//人物table
#define kPeopleCellLeftMargin 15
#define kPeopleCellTopMargin 20
#define kPeopleCellBottomMargin 20
#define kPeopleCellMargin 10
#define kPeopleCellNameFont [UIFont systemFontOfSize:15]
#define kPeopleCellSmallFont [UIFont systemFontOfSize:10]