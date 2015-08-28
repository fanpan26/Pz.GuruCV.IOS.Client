//
//  GRMyCardTopView.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/28.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GRMyCardTopFrame;
@interface GRMyCardTopView : UIView


@property(nonatomic,strong,readonly) UIImageView *userPhoto;
@property(nonatomic,strong,readonly) UILabel *userName;
@property(nonatomic,strong,readonly) UILabel *gradeMajor;
@property(nonatomic,strong,readonly) UILabel *company;
@property(nonatomic,strong,readonly) UILabel *position;
@property(nonatomic,strong,readonly) UIButton *userCard;
@property(nonatomic,strong,readonly) UIButton *userBiography;

@property(nonatomic,strong) GRMyCardTopFrame *topFrame;

@end
