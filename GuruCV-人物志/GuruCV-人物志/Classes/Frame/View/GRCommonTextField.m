//
//  GRCommonTextField.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/24.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRCommonTextField.h"

@implementation GRCommonTextField

 - (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:12];
        self.borderStyle = UITextBorderStyleRoundedRect;
    }
    return  self;
}


- (void)setFrame:(CGRect)frame
{
     // CGRectMake(10, 80, self.view.frame.size.width - 20, 30);
    frame.size.width = kScreenWidth - 20;
    frame.size.height = 40;
    [super setFrame:frame];

}
@end
