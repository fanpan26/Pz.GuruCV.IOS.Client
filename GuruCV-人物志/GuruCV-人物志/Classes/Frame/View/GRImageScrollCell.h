//
//  GRImageScrollCell.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/20.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRImageScrollCell : UITableViewCell

@property(nonatomic,strong) NSArray *scrollImages;//要滚动的图片

@property(nonatomic,assign,readonly) int cellHeight;

+(int)cellHeight;

@end
