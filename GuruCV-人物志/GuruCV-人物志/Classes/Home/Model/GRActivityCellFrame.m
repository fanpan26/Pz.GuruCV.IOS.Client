//
//  GRActivityCellFrame.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/22.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRActivityCellFrame.h"
#import "NSString+GR.h"



@implementation GRActivityCellFrame

/**
 *  重写set方法，设置frame
 *
 *  @param activity model
 */
-(void)setActivity:(GRActivityModel *)activity
{
    _activity = activity;
    CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width - 2 * kActivityCellHorizontalMargin;
    _frameUserView = CGRectMake(0, 0, cellWidth, 44);
    //头像
    CGFloat photoX = kActivityCellHorizontalMargin;
    CGFloat photoY = kActivityCellVertialMargin;
    CGFloat photoWidth = 30;
    CGFloat photoHeight = 30;
    _frameUserPhoto = CGRectMake(photoX, photoY, photoWidth, photoHeight);
    //人名
    CGFloat nameX = CGRectGetMaxX(_frameUserPhoto) + kActivityCellHorizontalMargin;
    CGFloat nameY = photoY + photoHeight * 0.25;
    CGSize nameSize = [NSString sizeWithString:activity.createUser.name font:kActivityUserFont];
    _frameUserName = (CGRect){{nameX,nameY},nameSize};
    //公司
    CGFloat companyX = CGRectGetMaxX(_frameUserName) + kActivityCellHorizontalMargin;
    CGFloat companyY = nameY;
    CGSize companySize = [NSString sizeWithString:activity.createUser.company font:kActivityUserFont];
    _frameUserCompany = (CGRect){{companyX,companyY},companySize};
    //职位
    CGFloat positionX = CGRectGetMaxX(_frameUserCompany) + kActivityCellHorizontalMargin;
    CGFloat positionY = companyY;
    CGSize positionSize = [NSString sizeWithString:activity.createUser.position font:kActivityUserFont];
    _frameUserPosition = (CGRect){{positionX,positionY},positionSize};
    //活动类型
    //活动标题
    CGFloat activityTitleX = photoX;
    CGFloat activityTitleY = CGRectGetMaxY(_frameUserCompany) + 2 * kActivityCellVertialMargin;
    CGRect activityTitleFrame = [NSString rectWithString:activity.activityTitle font:kActivityTitleFont width:cellWidth];
    _frameActivityTitle = CGRectMake(activityTitleX, activityTitleY, activityTitleFrame.size.width, activityTitleFrame.size.height);
    //活动内容（报名的）
    CGFloat activityContentX = activityTitleX;
    CGFloat activityContentY = CGRectGetMaxY(_frameActivityTitle) + 5;
    CGRect activityContentFrame = [NSString rectWithString:activity.createTime font:kActivityTitleFont width:cellWidth];
      _frameActivityCreateTime = CGRectMake(activityContentX, activityContentY, activityContentFrame.size.width, activityContentFrame.size.height);
    //最下边的bar
    _frameActivityBottomBar = CGRectMake(0, CGRectGetMaxY(_frameActivityCreateTime) + kActivityCellVertialMargin, cellWidth, 44);
    _cellHeight = CGRectGetMaxY(_frameActivityBottomBar);
}
@end
