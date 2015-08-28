//
//  GRSelectSchoolInfoView.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/25.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRBaseRegisterView.h"

@class GRSelectSchoolInfoView;

@protocol GRSelectSchoolInfoViewDelegate <NSObject>

@optional

- (void) grSelectViewDidTapped:(GRSelectSchoolInfoView *) grSelectView;

@end

@interface GRSelectSchoolInfoView : GRBaseRegisterView

- (void) setPlaceHolder:(NSString *)placeHolder;

- (void) setPlaceHolder:(NSString *)placeHolder color:(UIColor *) color;

@property(nonatomic,strong) NSString *type;

@property(nonatomic,weak) id<GRSelectSchoolInfoViewDelegate> delegate;
@end
