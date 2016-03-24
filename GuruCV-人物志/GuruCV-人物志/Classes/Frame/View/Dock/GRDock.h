//
//  GRDock.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/19.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GRDock;
@protocol GRDockDelegate<NSObject>

@optional
-(void) dock:(GRDock *)dock didClickedMenuAtIndex:(int) endIndex fromIndex:(int)startIndex;

@end

@interface GRDock : UIView

@property(nonatomic,weak) id<GRDockDelegate> delegate;

@property(nonatomic,assign,readonly) int selectedIndex;

@end
