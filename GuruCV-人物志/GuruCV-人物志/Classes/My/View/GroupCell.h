//
//  GroupCell.h
//  SinaWeiBo
//
//  Created by FanYuepan on 15/7/20.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "BaseCell.h"

typedef enum{
    CellTypeNone,
    CellTypeLabel,
    CellTypeArrow
} CellType;

@class  GRUserCardDetailModel;
@interface GroupCell : BaseCell

//不能用strong 否则循环引用
@property(nonatomic,weak) UITableView *cellTableView;

@property(nonatomic,strong) NSIndexPath *indexPath;
@property(nonatomic,assign) CellType cellType;
@property(nonatomic,readonly) UILabel *rightLabel;
@property(nonatomic,weak,readonly) UILabel *keyLabel;//标题
@property(nonatomic,weak,readonly) UILabel *valueLabel;//内容

@property(nonatomic,strong)GRUserCardDetailModel *detail;

+(instancetype)initWithTableView:(UITableView *)tableView;
@end
