//
//  GRPeopleCellFrame.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/28.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRPeopleCellFrame.h"
#import "NSString+GR.h"
#import "GRUserPeople.h"



@implementation GRPeopleCellFrame

-(CGFloat)cellHeight
{
    return CGRectGetMaxY(_framePeopleDesc) + kPeopleCellBottomMargin;
}
/**
 *  重写set方法
 *
 *  @param userModel
 */
- (void) setUserModel:(GRUserPeople *)userModel
{
    
    _userModel = userModel;
    //头像
    CGFloat photoX = kPeopleCellLeftMargin;
    CGFloat photoY = kPeopleCellTopMargin;
    CGFloat photoWidth = 60;
    CGFloat photoHeight = 60;
    CGRect photoFrame = CGRectMake(photoX, photoY, photoWidth, photoHeight);
    _frameUserPhoto = photoFrame;
    
    //姓名
    CGFloat nameX = CGRectGetMaxX(_frameUserPhoto) + kPeopleCellMargin;
    CGFloat nameY = photoY;
    CGRect nameRect =[NSString rectWithString:userModel.name font:kPeopleCellNameFont width:CGFLOAT_MAX];
    CGFloat nameWidth = nameRect.size.width;
    CGFloat nameHeight = nameRect.size.height;
    CGRect nameFrame = CGRectMake(nameX, nameY, nameWidth, nameHeight);
    _frameUserUserName = nameFrame;
    
    //company
    CGFloat companyX = CGRectGetMaxX(_frameUserUserName) + kPeopleCellMargin;
    CGRect companyRect =[NSString rectWithString:userModel.company font:kPeopleCellSmallFont width:CGFLOAT_MAX];
    CGFloat companyWidth = companyRect.size.width;
    CGFloat companyHeight = companyRect.size.height;
    CGFloat companyY = nameY + (nameY - companyHeight) * 0.5;
    CGRect companyFrame = CGRectMake(companyX, companyY, companyWidth, companyHeight);
    _frameUserCompany = companyFrame;
    
    //positon
    CGFloat positionX = CGRectGetMaxX(_frameUserCompany) + kPeopleCellMargin;
    NSLog(@"%f",companyY);
    CGFloat positionY = companyY;
    CGRect positionRect =[NSString rectWithString:userModel.position font:kPeopleCellSmallFont width:CGFLOAT_MAX];
    CGFloat positionWidth = positionRect.size.width;
    CGFloat positionHeight = positionRect.size.height;
    CGRect positionFrame = CGRectMake(positionX, positionY, positionWidth, positionHeight);
    _frameUserPosition = positionFrame;
    //major
    //studylevel
    //grade
    NSString *info = [NSString stringWithFormat:@"%@ | %@ | %@",userModel.major,userModel.studyLevel,userModel.grade];
    CGFloat infoX = nameX;
    CGFloat infoY = CGRectGetMaxY(_frameUserUserName) + kPeopleCellMargin;
    CGRect infoRect = [NSString rectWithString:info font:kPeopleCellSmallFont width:CGFLOAT_MAX];
    CGFloat infoWidth = infoRect.size.width;
    CGFloat infoHeight = infoRect.size.height;
    CGRect infoFrame = CGRectMake(infoX, infoY, infoWidth, infoHeight);
    _frameUserMajor = infoFrame;
    //desc
    CGFloat descX = nameX;
    CGFloat descY = CGRectGetMaxY(_frameUserMajor) + kPeopleCellMargin;
    CGFloat descWidth = kScreenWidth - 100 - kPeopleCellLeftMargin - kPeopleCellMargin;
    CGRect descRect = [NSString rectWithString:userModel.desc font:kPeopleCellSmallFont width:descWidth];
    CGRect descFrame = CGRectMake(descX, descY,descRect.size.width, descRect.size.height);
    _framePeopleDesc = descFrame;
}

@end
