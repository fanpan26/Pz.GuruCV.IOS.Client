//
//  GRCommonPwdTextField.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/24.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRCommonPwdTextField.h"

@implementation GRCommonPwdTextField

- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super  initWithFrame:frame]) {
        self.secureTextEntry = YES;
    }
    return self;
}

@end
