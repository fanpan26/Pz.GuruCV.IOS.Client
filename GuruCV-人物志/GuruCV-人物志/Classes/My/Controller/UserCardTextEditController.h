//
//  UserCardTextEditController.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/22.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//  普通文本编辑

#import <UIKit/UIKit.h>

@interface UserCardTextEditController : UIViewController
- (instancetype)initWithTitle:(NSString *)title value:(NSString *)value;
//将要编辑的职
@property (nonatomic,copy,readonly) NSString *willEditValue;
@end
