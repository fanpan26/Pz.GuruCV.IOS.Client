//
//  GRBottomBarItem.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/9/1.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRBottomBarItem : UIButton

- (instancetype) initWithIcon:(NSString *) icon title:(NSString *)title;

- (instancetype) initWithIcon:(NSString *)icon highlighted:(NSString *) highlighted title:(NSString *)title;

@end
