//
//  GRPeopleCell.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/20.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//学院人物列表cell

#import "GRPeopleCell.h"
#import "GRPeopleCellFrame.h"
#import "GRUserPeople.h"

@interface GRPeopleCell()
{
    UIImageView *_contentUserPhoto;
    UILabel *_contentUserName;
    UILabel *_contentCompany;
    UILabel *_contentPosition;
    UILabel *_contentMajor;
    UILabel *_contentStudyLevel;
    UILabel *_contentGrade;
    UILabel *_contentPeopleDesc;
}

@end

@implementation GRPeopleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //添加所有控件
        [self buildUI];
    }
    return self;
}

- (void) buildUI
{
    //人物头像
    UIImageView *photo = [[UIImageView alloc] init];
    [self addSubview:photo];
    _contentUserPhoto = photo;
    //人物姓名
    UILabel *name = [[UILabel alloc] init];
    name.font = kPeopleCellNameFont;
    [self addSubview:name];
    _contentUserName = name;
    //公司
    UILabel *company = [[UILabel alloc] init];
    company.font = kPeopleCellSmallFont;
    //company.textColor = kActivityUserInfoColor;
    [self addSubview:company];
    _contentCompany = company;
    //职位
    UILabel *position = [[UILabel alloc] init];
    position.font = kPeopleCellSmallFont;
   // position.textColor = kActivityUserInfoColor;
    [self addSubview:position];
    _contentPosition = position;
    //专业
    UILabel *major = [[UILabel alloc] init];
    [self addSubview:major];
    major.font = kPeopleCellSmallFont;
    _contentMajor = major;
    //学位
    UILabel *studylevel = [[UILabel alloc] init];
    [self addSubview:studylevel];
    _contentStudyLevel = studylevel;
    //年级
    UILabel *grade = [[UILabel alloc] init];
    [self addSubview:grade];
    _contentGrade = grade;
    //概述
    UILabel *desc = [[UILabel alloc] init];
    desc.font = kPeopleCellSmallFont;
    desc.textColor = kActivityUserInfoColor;//
    desc.numberOfLines = 0;
    [self addSubview:desc];
    _contentPeopleDesc = desc;
}


-(void)setCellFrame:(GRPeopleCellFrame *)cellFrame
{
    _cellFrame = cellFrame;
    GRUserPeople *model = cellFrame.userModel;
    _contentUserPhoto.frame = cellFrame.frameUserPhoto;
    _contentUserPhoto.image = [UIImage imageNamed:@"icon"];
    _contentUserName.frame = cellFrame.frameUserUserName;
    _contentUserName.text = model.name;
    if (model.major) {
        _contentMajor.hidden = NO;
        _contentMajor.frame = cellFrame.frameUserMajor;
        _contentMajor.text = [NSString stringWithFormat:@"%@ | %@ | %@",model.major,model.studyLevel,model.grade];
    }else{_contentMajor.hidden = YES;}
    if (model.company) {
        _contentCompany.hidden = NO;
        _contentCompany.frame = cellFrame.frameUserCompany;
        _contentCompany.text = model.company;
    }else{_contentCompany.hidden = YES;}
    if (model.position) {
        _contentPosition.hidden = NO;
        _contentPosition.frame = cellFrame.frameUserPosition;
        _contentPosition.text = model.position;
    }else{_contentPosition.hidden = YES;}
    _contentPeopleDesc.frame = cellFrame.framePeopleDesc;
    _contentPeopleDesc.text = model.desc;
}

@end
