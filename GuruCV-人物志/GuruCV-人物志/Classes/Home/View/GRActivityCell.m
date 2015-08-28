//
//  GRActivityCell.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/22.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRActivityCell.h"
#import "UIImage+GR.h"

@implementation GRActivityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBg];
        //添加内部控件
        [self addAllDetailViews];
    }
    return self;
}

- (void) addView:(UIView *)view
{
    [self.contentView addSubview:view];
}
//添加所有控件 不用管frame，直接全部添加进去
-(void)addAllDetailViews
{
    UIImageView *user = [[UIImageView alloc]init];
    [self addView:user];
    _contentUserView = user;
    //用户头像
    UIImageView *photo = [[UIImageView alloc] init];
    [self addView:photo];
    _contentUserPhoto = photo;
    //用户姓名
    UILabel *name = [[UILabel alloc] init];
    name.font = kActivityUserFont;
    [self addView:name];
    _contentUserName = name;
    //用户公司
    UILabel *company = [[UILabel alloc] init];
    company.font = kActivityUserFont;
    company.textColor = kActivityUserInfoColor;
    [self addView:company];
    _contentUserCompany = company;
    //用户职位
    UILabel *position = [[UILabel alloc] init];
    position.font = kActivityUserFont;
    position.textColor = kActivityUserInfoColor;
    [self addView:position];
    _contentUserPosition = position;
    
    
    //活动icon
    UIImageView *activityIcon = [[UIImageView alloc] init];
    [self addView:activityIcon];
    _contentUserPhoto = activityIcon;
    //活动标题
    UILabel *title = [[UILabel alloc] init];
    title.font = kActivityTitleFont;
    title.numberOfLines = 0;
    [self addView:title];
    _contentActivityTitle = title;
    //活动内容
    UILabel *content = [[UILabel alloc] init];
    content.font = kActivityTitleFont;
    content.numberOfLines = 0;
    content.textColor = [UIColor grayColor];
    [self addView:content];
    _contentActivityCreateTime = content;
    //活动底部bar
    GRActivityBottomBar *bar = [[GRActivityBottomBar alloc] init];
    [self addView:bar];
    _contentActivityBottomBar = bar;
    _contentUserView.hidden = YES;
}

//设置背景图片
- (void)setBg
{
    self.backgroundColor = [UIColor clearColor];
    // 1.默认背景
    _bg.image = [UIImage resizedImage:@"common_card_background.png"];
    
    // 2.长按背景
    _selectedBg.image = [UIImage resizedImage:@"common_card_background_highlighted.png"];
}

-(void)setCellFrame:(GRActivityCellFrame *)cellFrame
{
    _cellFrame = cellFrame;
    GRActivityModel *model = cellFrame.activity;
    _contentUserView.frame =cellFrame.frameUserView;
    _contentUserView.image = [UIImage resizedImage:@"statusdetail_comment_background_middle"];
    
    //头像
    _contentUserPhoto.frame = cellFrame.frameUserPhoto;
    _contentUserPhoto.image = [UIImage imageNamed:model.createUser.headPhotos];
    //姓名
    _contentUserName.frame = cellFrame.frameUserName;
    _contentUserName.text = model.createUser.name;
  
    //公司名称
    _contentUserCompany.frame =cellFrame.frameUserCompany;
    _contentUserCompany.text = model.createUser.company;
    //职位
    _contentUserPosition.frame = cellFrame.frameUserPosition;
    _contentUserPosition.text = model.createUser.position;
    //活动标题
    _contentActivityTitle.frame = cellFrame.frameActivityTitle;
    _contentActivityTitle.text = model.activityTitle;
    //活动内容
    _contentActivityCreateTime.frame = cellFrame.frameActivityCreateTime;
    _contentActivityCreateTime.text = model.createTime;
    //下边的bar
    _contentActivityBottomBar.hidden = YES;
    //
}

-(void)setFrame:(CGRect)frame
{
   // frame.origin.x = kActivityTableBorderMargin;
    frame.size.height -= kActivityTableBorderMargin;
    //frame.size.width -= kActivityTableBorderMargin * 2;
    [super setFrame:frame];
}

@end
