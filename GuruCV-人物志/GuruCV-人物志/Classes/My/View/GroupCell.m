//
//  GroupCell.m
//  SinaWeiBo
//
//  Created by FanYuepan on 15/7/20.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GroupCell.h"
#import "UIImage+GR.h"
#import "NSString+GR.h"
#import "GRUserCardDetailModel.h"

#define kDetailCellKeyFont [UIFont systemFontOfSize:13];
#define kDetailCellValueFont [UIFont systemFontOfSize:12];
@implementation GroupCell

+ (instancetype)initWithTableView:(UITableView *)tableView
{
    static NSString *cellId = @"MoreCell";
    GroupCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ) {
        cell =[[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.cellTableView = tableView;
        cell.backgroundColor = [UIColor clearColor];//将背景颜色设置为空 否则白底很难看
        [cell addKeyValueLabel];
    }
    return cell;
}

- (void) addKeyValueLabel
{
    UILabel *keyLabel = [[UILabel alloc] init];
    UILabel *valueLabel = [[UILabel alloc] init];
    keyLabel.font = kDetailCellKeyFont;
    valueLabel.font = kDetailCellValueFont;
    valueLabel.textColor = kColor(70.0,86.0,108.0);
    [self.contentView addSubview:keyLabel];
    [self.contentView addSubview:valueLabel];
    _keyLabel = keyLabel;
    _valueLabel = valueLabel;
}

-(void)setIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count = [_cellTableView numberOfRowsInSection:indexPath.section];
    if (count == 1) {
        _bg.image = [UIImage resizedImage:@"common_card_background"];
        _selectedBg.image = [UIImage resizedImage:@"common_card_background_highlighted"];
    }
    else if(indexPath.row == 0){
        _bg.image = [UIImage resizedImage:@"common_card_top_background"];
        _selectedBg.image = [UIImage resizedImage:@"common_card_top_background_highlighted"];
    }
    else if(indexPath.row == count - 1){
        _bg.image = [UIImage resizedImage:@"common_card_bottom_background"];
        _selectedBg.image = [UIImage resizedImage:@"common_card_bottom_background_highlighted"];
    }else{
        _bg.image = [UIImage resizedImage:@"common_card_middle_background"];
        _selectedBg.image = [UIImage resizedImage:@"common_card_middle_background_highlighted"];
    }

}

- (void)setCellType:(CellType)cellType
{

    _cellType = cellType;
    if (_cellType == CellTypeArrow) {
         self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_arrow"]];
    }
    else if(_cellType == CellTypeLabel){
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.backgroundColor = [UIColor clearColor];
        _rightLabel.bounds = CGRectMake(0, 0, 60, 44);
        _rightLabel.textColor = [UIColor grayColor];
        _rightLabel.textAlignment = NSTextAlignmentCenter;
        _rightLabel.font = [UIFont systemFontOfSize:13];

        self.accessoryView = _rightLabel;
    }
    else if(_cellType == CellTypeNone){
        self.accessoryView = nil;
    }
}

- (void)setDetail:(GRUserCardDetailModel *)detail
{
    _detail = detail;

    _keyLabel.text = detail.cardkey;
    _valueLabel.text = detail.cardValue;
    UIFont *fontkey = kDetailCellKeyFont;
    UIFont *fontValue = kDetailCellValueFont;
    CGSize keySize = [NSString sizeWithString:detail.cardkey font:fontkey];
    CGSize valueSize = [NSString sizeWithString:detail.cardValue font:fontValue];
    _keyLabel.frame = CGRectMake(5, 0, keySize.width, self.frame.size.height);
    _valueLabel.frame = CGRectMake(50, 0, valueSize.width , self.frame.size.height);
    
}
@end
