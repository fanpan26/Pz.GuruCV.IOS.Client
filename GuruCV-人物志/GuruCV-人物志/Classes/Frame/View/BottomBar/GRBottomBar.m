//
//  GRBottomBar.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/9/1.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRBottomBar.h"
#define  kBottomBarMargin 10

@implementation GRBottomBar


-(void)addItem:(NSString *)title icon:(NSString *)icon
{
    GRBottomBarItem *item = [[GRBottomBarItem alloc] initWithIcon:icon title:title];
    NSInteger itemCount = self.subviews.count;
    item.frame = CGRectMake(kBottomBarMargin + itemCount * (100 + kBottomBarMargin) * itemCount, 0,100 , self.frame.size.height);
    [item setBackgroundColor:[UIColor blackColor]];
    item.titleLabel.font = kActivityTitleFont;
    [self addSubview:item];
    [self resetItemWidth];
}

- (void)resetItemWidth
{
    NSInteger count = self.subviews.count;
    CGFloat width = (self.frame.size.width - (count + 1) * kBottomBarMargin) / count;
    for (int i = 0 ; i < count; i ++) {
        GRBottomBarItem *item = self.subviews[i];
        CGRect frame = item.frame;
        frame.origin.x = i *(width +kBottomBarMargin) + kBottomBarMargin;
        frame.size.width = width;
        item.frame = frame;
    }
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height = 44;
    [super setFrame:frame];
}

@end
