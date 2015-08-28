//
//  PeopleController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/19.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "PeopleController.h"
#import "UIBarButtonItem+MJ.h"
#import "GRUserPeople.h"
#import "GRPeopleCellFrame.h"
#import "GRPeopleCell.h"
#import "DataTool.h"
#import "GRImageScrollCell.h"

@interface PeopleController()
{
    NSMutableArray *peopleData;
}
@end

@implementation PeopleController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"学院人物";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navbar_down" highlightedIcon:@"navbar_down_highlighted" target:self action:nil];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"navbar_search" highlightedIcon:@"navbar_search_highlighted" target:self action:nil];
    //初始化数据
    NSArray *array = [DataTool peoples];
    peopleData = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(GRUserPeople *obj, NSUInteger idx, BOOL *stop) {
        GRPeopleCellFrame *frame = [[GRPeopleCellFrame alloc] init];
        frame.userModel = obj;
        [peopleData addObject:frame];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

//每个组的cell个数
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        //第一组 滚动cell
        return 1;
    }
    return peopleData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        GRImageScrollCell *imageCell = [[GRImageScrollCell alloc] init];
        imageCell.scrollImages = [DataTool peopleTopImages];
        return imageCell;
    }
    GRPeopleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"peopleCell"];
    
    if (cell == nil) {
        cell = [[GRPeopleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"peopleCell"];
    }
    cell.cellFrame = peopleData[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [GRImageScrollCell cellHeight];
    }else
    {
        GRPeopleCellFrame *frame = peopleData[indexPath.row];
        return  frame.cellHeight;
    }
}


@end
