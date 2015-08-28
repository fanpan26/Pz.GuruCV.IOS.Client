//
//  NSString+GR.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/22.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "NSString+GR.h"

@implementation NSString(GR)

+(CGSize)sizeWithString:(NSString *)string font:(UIFont *)font
{
    NSDictionary *dict = @{
                           NSFontAttributeName:font
                           };
   return [string sizeWithAttributes:dict];
}



+ (CGRect)rectWithString:(NSString *)string font:(UIFont *)font width:(CGFloat)width{
    //获取字符串显示高度
    NSDictionary *dic = @{NSFontAttributeName:font};
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    return rect;
}


@end
