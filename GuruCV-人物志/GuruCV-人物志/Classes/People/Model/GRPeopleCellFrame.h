//
//  GRPeopleCellFrame.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/28.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GRUserPeople;

@interface GRPeopleCellFrame : NSObject

@property(nonatomic,assign,readonly) CGRect frameUserPhoto;
@property(nonatomic,assign,readonly) CGRect frameUserUserName;
@property(nonatomic,assign,readonly) CGRect frameUserCompany;
@property(nonatomic,assign,readonly) CGRect frameUserPosition;
@property(nonatomic,assign,readonly) CGRect frameUserMajor;
@property(nonatomic,assign,readonly) CGRect frameUserStudyLevel;
@property(nonatomic,assign,readonly) CGRect frameUserGrade;
@property(nonatomic,assign,readonly) CGRect framePeopleDesc;
@property(nonatomic,assign,readonly) CGFloat cellHeight;

@property(nonatomic,strong) GRUserPeople *userModel;

@end
