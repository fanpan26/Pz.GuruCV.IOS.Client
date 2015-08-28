//
//  GRUserContact.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/19.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRUser.h"

@interface GRUserContact : GRUser

@property(nonatomic,copy) NSString *mobile;//电话
@property(nonatomic,copy) NSString *mail;//邮箱
@property(nonatomic,copy) NSString *landline;//座机
@property(nonatomic,copy) NSString *wechat;//微信
@property(nonatomic,copy) NSString *address;//地址

@end
