//
//  GRSelectSchoolInfoView.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/25.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRSelectSchoolInfoView.h"

@interface GRSelectSchoolInfoView()
{
    UILabel *_placeHolderLabel;
}

@end

@implementation GRSelectSchoolInfoView


- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UILabel *label =[[UILabel alloc] init];
        label.frame = CGRectMake(5, 0, self.frame.size.width, self.frame.size.height);
        //label.text = @"专业";
        label.font = kBusinessCommonFont;
        label.textColor = kColor(151, 151, 151);
        [self addSubview: label];
        
        //尖头
        UIImageView *imageArrow = [[UIImageView alloc] init];
        imageArrow.frame = CGRectMake(self.frame.size.width - 20, (self.frame.size.height - 20) * 0.5, 20, 20);
        imageArrow.image = [UIImage imageNamed:@"common_icon_small_arrow"];
        [self addSubview: imageArrow];
        
        _placeHolderLabel = label;
        
        
        UITapGestureRecognizer *rec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAlert:)];
        [self addGestureRecognizer:rec];
    }
    return  self;
}


- (void)tapAlert:(UITapGestureRecognizer *) tapGesture
{
    if (_delegate && [_delegate respondsToSelector:@selector(grSelectViewDidTapped:)]) {
        [_delegate grSelectViewDidTapped:self];
    }
}

- (void)setPlaceHolder:(NSString *)placeHolder
{
    _placeHolderLabel.text = placeHolder;
    _placeHolderLabel.textColor = kColor(151, 151, 151);
}

-(void)setPlaceHolder:(NSString *)placeHolder color:(UIColor *)color
{
    _placeHolderLabel.text = placeHolder;
    _placeHolderLabel.textColor = color;
}

@end
