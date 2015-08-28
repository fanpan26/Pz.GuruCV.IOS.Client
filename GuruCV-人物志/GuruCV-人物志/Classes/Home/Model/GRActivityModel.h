//
//  GRActivityModel.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/22.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, GRActivityType) {
    GRActivityTypeActivity = 0, //活动
    GRActivityTypeMemory,       //经历
    GRActivityTypeArticle       //文章
};

@class GRUser;
@interface GRActivityModel : NSObject

@property(nonatomic,strong,readonly) GRUser *createUser;//发表人
@property(nonatomic,assign,readonly) GRActivityType activityType;//类型 活动 经历 文章
@property(nonatomic,copy,readonly) NSString *activityTitle;//标题
@property(nonatomic,copy,readonly) NSString *createTime;//创建时间
@property(nonatomic,assign,readonly) NSUInteger signCount;//报名个数
@property(nonatomic,assign,readonly) NSUInteger attitudeCount;//赞个数
@property(nonatomic,assign,readonly) NSUInteger commentCount;//评论个数
@property(nonatomic,assign,readonly) NSUInteger vertifyCount;//认证个数

/**
 *  字典转模型
 *
 *  @param dict
 *
 *  @return
 */
- (instancetype) initWithDict:(NSDictionary *)dict;

+ (NSArray *)activitiesFromData:(NSArray *)data;

@end
