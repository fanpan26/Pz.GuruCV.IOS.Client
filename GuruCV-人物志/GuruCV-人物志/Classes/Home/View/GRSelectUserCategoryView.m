//
//  GRSelectUserCategoryView.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/25.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRSelectUserCategoryView.h"

@interface GRSelectUserCategoryView()
{
     NSArray *categories ;
    UIButton *_selectedBtn;
}
@end
@implementation GRSelectUserCategoryView

-(instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        if (categories == nil) {
            categories = [NSArray arrayWithObjects:@"在校生",@"校友",@"教师",@"教职工", nil];
        }
        [self addButtons];
    }
    return self;
}

/**
 *  添加四个button
 */
- (void) addButtons
{
    CGFloat btnWidth = (self.frame.size.width - 5 * 10) * 0.25;
    for (int i = 0; i < 4; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:categories[i] forState:UIControlStateNormal];
        [btn setTitleColor:kColor(151, 151, 151) forState:UIControlStateNormal];//浅灰色
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [btn.layer setMasksToBounds:YES];
        [btn.layer setCornerRadius:5.0];//设置矩形四个圆角半径
        btn.titleLabel.font = kBusinessCommonFont;
        btn.frame = CGRectMake(10 + i * (btnWidth + 10), 5, btnWidth, 30);
        [btn addTarget:self action:@selector(categoryClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        if (i == 0) {
            [self categoryClick:btn];
        }
    }
}

- (void)categoryClick:(UIButton *)btn
{
    _selectedBtn.selected = NO;
    _selectedBtn.backgroundColor = [UIColor whiteColor];
    btn.selected = YES;
    btn.backgroundColor = kColor(151, 151, 151);
    _selectedBtn = btn;
}

@end
