//
//  GRUser.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/19.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRUser : NSObject

@property(nonatomic,assign) long cvNumber;//用户咕噜号
@property(nonatomic,copy) NSString *name;//姓名
@property(nonatomic,copy) NSString *company;//公司
@property(nonatomic,copy) NSString *position;//职位
@property(nonatomic,copy) NSString *achieveTags;//成就标签
@property(nonatomic,copy) NSString *abilityTags;//能力标签
@property(nonatomic,copy) NSString *headPhotos;//头像


@end
