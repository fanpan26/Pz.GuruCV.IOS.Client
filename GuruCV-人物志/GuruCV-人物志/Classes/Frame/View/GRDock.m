//
//  GRDock.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/19.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//  底部菜单

#import "GRDock.h"
#import "UIImage+GR.h"
#import "GRDockItem.h"

@interface GRDock()
{
    UIButton *_selectedItem;
}
@end

@implementation GRDock

- (instancetype) initWithFrame:(CGRect) frame
{
    if (self = [super initWithFrame:frame]) {
      //  self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
        self.backgroundColor = kColor(242, 242, 242);
        [self addMenuItems];
    }
    return self;
}

#pragma mark 添加底部的五个菜单（按钮）

- (void) addMenuItems
{
    NSArray *array = [NSArray arrayWithObjects:@"劳人记忆",@"人物",@"互助",@"我的",@"关于", nil];
    CGFloat btnWidth = kScreenWidth * 0.2;
    for(int i = 0; i < 5 ; i++)
    {
        GRDockItem *btn = [GRDockItem buttonWithType:UIButtonTypeCustom];
        //文字
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:kDockItemNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_slider"] forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        //frame
        btn.frame = CGRectMake(btnWidth * i, 0, btnWidth, kDockHeight);
        //tag供外界调用
        btn.tag = i;
        //点击事件
        [btn addTarget:self action:@selector(didClickMenuItem:) forControlEvents:UIControlEventTouchDown];
        if (i == 0) {
            [self didClickMenuItem:btn];
        }
        [self addSubview:btn];
        
    }
}

-(void) didClickMenuItem:(GRDockItem *)button
{
    if ([_delegate respondsToSelector:@selector(dock:didClickedMenuAtIndex:fromIndex:)]) {
        [_delegate dock:self didClickedMenuAtIndex:(int)button.tag fromIndex:(int)_selectedItem.tag];
    }
    _selectedItem.selected = NO;
    button.selected = YES;
    _selectedItem = button;
    _selectedIndex = button.tag;
}

/**
 *  重写frame方法，设置宽高
 *
 *  @param frame 
 */
-(void)setFrame:(CGRect)frame
{
    frame.size.width = kScreenWidth;
    frame.size.height = kDockHeight;
    [super setFrame:frame];
}

@end
