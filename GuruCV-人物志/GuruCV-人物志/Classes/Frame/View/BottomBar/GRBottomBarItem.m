//
//  GRBottomBarItem.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/9/1.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRBottomBarItem.h"

@implementation GRBottomBarItem

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title
{
    if (self == [super init]) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    }
    return self;
}

- (instancetype)initWithIcon:(NSString *)icon highlighted:(NSString *)highlighted title:(NSString *)title
{
    if (self = [self initWithIcon:icon title:title]) {
        [self setImage:[UIImage imageNamed:highlighted] forState:UIControlStateHighlighted];
    }
    return self;
}

@end
