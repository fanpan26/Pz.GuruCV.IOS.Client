//
//  GRMyCardTopView.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/28.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//  我的 上部分

#import "GRMyCardTopView.h"
#import "NSString+GR.h"
#import "GRUserPeople.h"
#import "GRMyCardBottomBarView.h"

#define kMyTopViewLeftMargin 20
#define kMyTopViewTopMargin 40
#define kMyTopViewBackColor kColor(213,39,74)

@interface GRMyCardTopView()
{
    
    UIButton *_userPhoto;
    UILabel *_userName;
    UILabel *_gradeMajor;
    UILabel *_company;
    UILabel *_position;
    UIButton *_userCard;
    UIButton *_userBiography;
    GRMyCardBottomBarView *_bottonBar;
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
    self.backgroundColor = kMyTopViewBackColor;
    _userPhoto = [[UIButton alloc] init];
    _userPhoto.imageEdgeInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    [_userPhoto setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:_userPhoto];
    
    _userName = [[UILabel alloc] init];
    _userName.textColor = [UIColor whiteColor];
    [self addSubview:_userName];
    
    _gradeMajor = [[UILabel alloc] init];
    _gradeMajor.font = kActivityUserFont;
    _gradeMajor.textColor = [UIColor whiteColor];
    [self addSubview:_gradeMajor];
    
    _company = [[UILabel alloc] init];
    [self addSubview:_company];
    
    _position = [[UILabel alloc] init];
    [self addSubview:_position];
    
    _company.font = kActivityUserFont;
    _company.textColor = [UIColor whiteColor];
    _position.font = kActivityUserFont;
    _position.textColor = [UIColor whiteColor];
    
    NSDictionary *dict =@{@"icon_card":@"名片",@"icon_edit":@"传记"};
    _bottonBar = [[GRMyCardBottomBarView alloc] initWithImageDictionary:dict];
    //_bottonBar.delegate = self;
    [self addSubview:_bottonBar];
//    _userCard = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_userCard setTitle:@"名片" forState:UIControlStateNormal];
//    [_userCard setImage:[UIImage imageNamed:@"icon_card"] forState:UIControlStateNormal];
//    [_userCard setImage:[UIImage imageNamed:@"icon_card_highlighted"] forState:UIControlStateHighlighted];
//    [self addSubview:_userCard];
//    
//    _userBiography = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_userBiography setTitle:@"名片" forState:UIControlStateNormal];
//    [_userBiography setImage:[UIImage imageNamed:@"icon_edit"] forState:UIControlStateNormal];
//    [_userBiography setImage:[UIImage imageNamed:@"icon_edit_highlighted"] forState:UIControlStateHighlighted];
//    [self addSubview:_userBiography];
    
}

- (void)setUserModel:(GRUserPeople *)userModel
{
    _userModel = userModel;
    //开始计算位置
    //姓名
    CGFloat photoX = kMyTopViewLeftMargin;
    CGFloat photoY = kMyTopViewTopMargin;
    CGFloat photoWidth = 55;
    CGFloat photoHeight = 55;
    _userPhoto.frame = CGRectMake(photoX, photoY, photoWidth, photoHeight);
    [_userPhoto setImage:[UIImage imageNamed:@"icon"] forState: UIControlStateNormal] ;
    CGFloat nameX = CGRectGetMaxX(_userPhoto.frame) + kMyTopViewLeftMargin;
    CGFloat nameY = kMyTopViewTopMargin;
    _userName.font = [UIFont systemFontOfSize:16];

    CGSize size = [NSString sizeWithString:userModel.name font:_userName.font];
    _userName.frame = CGRectMake(nameX, nameY, size.width,size.height);
    _userName.text =  userModel.name;
    //专业年级
    NSString *gradeMajor = [NSString stringWithFormat:@"%@ | %@ | %@",userModel.grade,userModel.major,userModel.studyLevel];
    _gradeMajor.text = gradeMajor;
    CGFloat majorX = nameX;
    CGFloat majorY = CGRectGetMaxY(_userName.frame) + 10;
    CGSize majorSize =  [NSString sizeWithString:gradeMajor font:kActivityUserFont];
    _gradeMajor.frame = CGRectMake(majorX, majorY, majorSize.width, majorSize.height);
    
    //公司 职位
    
    CGFloat companyX = nameX;
    CGFloat companyY = CGRectGetMaxY(_gradeMajor.frame) + 10;
    CGSize companySize = [NSString sizeWithString:userModel.company font:kActivityUserFont];

    _company.text = userModel.company;
    _company.frame = CGRectMake(companyX, companyY, companySize.width , companySize.height);
    CGFloat positionX = CGRectGetMaxX(_company.frame) + 10;
    CGFloat positionY = companyY;
    CGSize positionSize = [NSString sizeWithString:userModel.position font:kActivityUserFont];
    
    _position.text = userModel.position;
    _position.frame = CGRectMake(positionX, positionY, positionSize.width, positionSize.height);
    _bottonBar.frame = CGRectMake(0, self.frame.size.height - _bottonBar.frame.size.height, 0, 0);
    
}



-(void)setFrame:(CGRect)frame
{
    frame.size.height = 200;
    frame.size.width = kScreenWidth;
    [super setFrame:frame];
}

@end
