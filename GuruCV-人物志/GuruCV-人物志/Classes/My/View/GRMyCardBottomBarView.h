//
//  GRMyCardBottomBarView.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/29.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GRMyCardBottomBarView;

@protocol GRMyCardBottomBarViewDeletage <NSObject>

@optional

- (void)myCardView:(GRMyCardBottomBarView *)myCardView didClickedBarItem:(UIButton *)item;

@end

@interface GRMyCardBottomBarView : UIView

@property(nonatomic,weak) id<GRMyCardBottomBarViewDeletage> delegate;

- (instancetype) initWithImageDictionary:(NSDictionary *)dict;

@end
