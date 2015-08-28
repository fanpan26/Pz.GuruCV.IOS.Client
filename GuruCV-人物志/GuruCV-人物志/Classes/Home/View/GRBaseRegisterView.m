//
//  GRBaseRegisterView.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/25.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRBaseRegisterView.h"

@implementation GRBaseRegisterView

-(instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5.0;
    }
    return self;
}



- (void)setFrame:(CGRect)frame
{
    // CGRectMake(10, 80, self.view.frame.size.width - 20, 30);
    //frame.origin.x = 0;
    frame.size.width = kScreenWidth - 20;
    frame.size.height = 40;
    [super setFrame:frame];
    
}

@end
