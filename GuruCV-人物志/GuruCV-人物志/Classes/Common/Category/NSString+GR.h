//
//  NSString+GR.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/22.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString(GR)

/**
 *  根据内容和字体获取宽度高度（cgsize）
 *
 *  @param string
 *  @param font
 *
 *  @return 
 */
+(CGSize) sizeWithString:(NSString *) string font:(UIFont *)font;

/**
 *  获取cgrect
 *
 *  @param string
 *  @param font
 *  @param width
 *
 *  @return 
 */
+(CGRect)rectWithString:(NSString *)string font:(UIFont *)font width:(CGFloat)width;
@end
