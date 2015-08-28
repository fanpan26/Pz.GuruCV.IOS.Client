//
//  GRActivityModel.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/22.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRActivityModel.h"
#import "GRUser.h"

@implementation GRActivityModel


- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        _activityTitle = @"测试标题，天才在线科技有限公司正在筹划劳动人事学院，老人记忆";
        _activityType = GRActivityTypeActivity;
        _signCount = 0;
        _commentCount = 903;
        _attitudeCount = 87;
        _createTime = @"活动时间：2015-8-22 大家在中关村软件园下边集合，不允许迟到，已经报名十几个人了哦";
        _vertifyCount = 98;
        _createUser = [[GRUser alloc] init];
        _createUser.cvNumber = 111111;
        _createUser.company = @"天才在线科技有限公司";
        _createUser.position = @"研发总裁";
        _createUser.headPhotos = @"Icon.png";
        _createUser.name = @"余晶莹";
    }
    return self;
}

+ (NSArray *)activitiesFromData:(NSArray *)data
{
    return nil;
}
@end
