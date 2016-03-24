//
//  GRMyCardBottomBarView.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/29.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRMyCardBottomBarView.h"

#define  kMyCardBarButtonMargin 10

@implementation GRMyCardBottomBarView

-(instancetype)initWithImageDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self buildUI:dict];
    }
    return self;
}

- (void)buildUI:(NSDictionary *)dict
{
    self.backgroundColor = kColor(156, 0, 34);
    //遍历添加按钮
    NSInteger count = dict.count;
    //计算按钮宽度
    CGFloat buttonWidth = (self.frame.size.width - (count + 1) * kMyCardBarButtonMargin) / count;
   __block NSInteger index = 0;
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(kMyCardBarButtonMargin + (buttonWidth + kMyCardBarButtonMargin) * index, 0, buttonWidth, self.frame.size.height);
        [btn setImage:[UIImage imageNamed:key] forState:UIControlStateNormal];
        NSString *image = key;
        image =  [image stringByAppendingString:@"_highlighted"];
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
        btn.titleLabel.font = kActivityUserFont;
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 3, 0);
        [btn setTitle:obj forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = index;
        [self addSubview:btn];
        if(index != count - 1){
            UILabel *label = [[UILabel alloc ] init];
            label.text = @"|";
            label.textColor = [UIColor whiteColor];
            label.frame = CGRectMake(CGRectGetMaxX(btn.frame) + kMyCardBarButtonMargin * 0.5, 0, 2, self.frame.size.height);
            [self addSubview:label];
        }
        index ++;
    }];
}

- (void)clickBtn:(UIButton *)btn
{
    if (_delegate&&[_delegate respondsToSelector:@selector(myCardView:didClickedBarItem:)]) {
        [_delegate myCardView:self didClickedBarItem:btn];
    }
}

- (void)setFrame:(CGRect)frame
{
    frame.size.width = kScreenWidth;
    frame.size.height = 44;
    [super setFrame:frame];
}

@end
