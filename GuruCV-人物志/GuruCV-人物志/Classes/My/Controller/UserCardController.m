//
//  UserCardController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/22.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "UserCardController.h"
#import "GroupCell.h"
#import "DataTool.h"
#import "GRUserContact.h"
#import "GRUserCardDetailModel.h"
#import "GRUserCardListModel.h"

#import "UserCardTagsEditController.h"
#import "UserCardTextEditController.h"

@interface UserCardController()
{
    NSArray *_data;
}

@end

@implementation UserCardController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self buildUI];
    
    [self loadPlist];
    
    [self buildTableView];
}

- (void) buildUI
{
    self.title = @"编辑名片";
}

- (void) loadPlist
{
    GRUserContact *userCard = [[GRUserContact alloc] init];
    userCard.headPhotos = @"";
    userCard.name = @"范月盘";
    userCard.company = @"天才在线科技有限公司";
    userCard.position = @"研发工程师";
    userCard.abilityTags = @"MVC,JS,C#,.NET";
    userCard.achieveTags = @"消息推送服务端,iOS客户端";
    userCard.mobile = @"18801102076";
    userCard.landline = @"8090381";
    userCard.address = @"北京市海淀区中关村软件园2A 2228";
    userCard.wechat = @"PzEzreal";
    userCard.mail = @"fanpan26@126.com";
    userCard.cvNumber = 111111;
    _data =[NSArray arrayWithArray:[DataTool userCardTableDataSource:userCard]];
    [self.tableView reloadData];
}

//
- (void) buildTableView
{
    
    self.tableView.backgroundColor = [UIColor whiteColor];
//    self.tableView.sectionHeaderHeight = 5;
//    self.tableView.sectionFooterHeight = 0;
//    UIView *headView = [[UIView alloc] init];
//    headView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 5);
//    self.tableView.tableHeaderView = headView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    //增加底部滚动区域
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);

}

//

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_data[section] cardDetails] count];
}

/**
 *  组标题
 *
 *  @param tableView
 *  @param section
 *
 *  @return
 */
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
     GRUserCardListModel *sectionModel = _data[section];
     return  sectionModel.cardCategoryName;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"记载cell");
    GroupCell *cell = [GroupCell initWithTableView:tableView];
    GRUserCardDetailModel *detail = [[_data[indexPath.section] cardDetails] objectAtIndex:indexPath.row];
    cell.indexPath = indexPath;
    cell.cellType = CellTypeArrow;
    cell.detail = detail;
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    GRUserCardDetailModel *detail = [[_data[indexPath.section] cardDetails] objectAtIndex:indexPath.row];
    UIViewController *pushController ;
    switch (detail.cardEditType) {
        case GRCardEditTypePhoto:
            pushController = [[UserCardTagsEditController alloc] init];
            break;
        case GRCardEditTypeTags:
            pushController = [[UserCardTagsEditController alloc] init];
            break;
        case GRCardEditTypeText:
            pushController = [[UserCardTextEditController alloc] initWithTitle:detail.cardkey value:detail.cardValue];
            break;
        case GRCardEditTypeValidate:
              pushController = [[UserCardTagsEditController alloc] init];
            break;
    }
    if(pushController == nil){pushController = [[UIViewController alloc] init];}
    //跳转到编辑页面
    [self.navigationController pushViewController:pushController animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

@end
