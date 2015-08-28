//
//  GRMyCardTopView.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/28.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//  我的 上部分

#import "GRMyCardTopView.h"
#import "NSString+GR.h"

@interface GRMyCardTopView()
{
    
    UIImageView *_userPhoto;
    UILabel *_userName;
    UILabel *_gradeMajor;
    UILabel *_company;
    UILabel *_position;
    UIButton *_userCard;
    UIButton *_userBiography;
}

@end

@implementation GRMyCardTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}


-(void) buildUI
{
    _userPhoto = [[UIImageView alloc] init];
    [self addSubview:_userPhoto];
    
    _userName = [[UILabel alloc] init];
    [self addSubview:_userName];
    
    _gradeMajor = [[UILabel alloc] init];
    [self addSubview:_gradeMajor];
    
    _company = [[UILabel alloc] init];
    [self addSubview:_company];
    
    _position = [[UILabel alloc] init];
    [self addSubview:_position];
    
    _userCard = [UIButton buttonWithType:UIButtonTypeCustom];
    [_userCard setTitle:@"名片" forState:UIControlStateNormal];
    [_userCard setImage:[UIImage imageNamed:@"icon_card"] forState:UIControlStateNormal];
    [_userCard setImage:[UIImage imageNamed:@"icon_card_highlighted"] forState:UIControlStateHighlighted];
    [self addSubview:_userCard];
    
    _userBiography = [UIButton buttonWithType:UIButtonTypeCustom];
    [_userBiography setTitle:@"名片" forState:UIControlStateNormal];
    [_userBiography setImage:[UIImage imageNamed:@"icon_edit"] forState:UIControlStateNormal];
    [_userBiography setImage:[UIImage imageNamed:@"icon_edit_highlighted"] forState:UIControlStateHighlighted];
    [self addSubview:_userBiography];
    
}

- (void)setUserModel:(GRUserPeople *)userModel
{
    _userModel = userModel;
    
}

@end
