//
//  HomeController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/19.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "HomeController.h"
#import "UIBarButtonItem+MJ.h"
#import "DataTool.h"
#import "GRImageScrollCell.h"
#import "GRActivityCell.h"
#import "MemoryDetailController.h"
#import "HttpTool.h"

@interface HomeController()
{
    NSArray *_topImages;
    NSMutableArray *_activiesData;
}

@end

@implementation HomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadUI];
    [self loadTopImages];
    [self loadActivies];
//    [HttpTool postWithPath:@"app/api/verifyToken" params:nil success:^(id JSON) {
//        NSLog(@"%@",JSON[@"msg"]);
//        
//    } failure:^(NSError *error) {
//        NSLog(@"%@",error);
//    }];
//    
//    [HttpTool postWithPath:@"/app/api/user/findCompany" params:@{@"clientType":@1,@"userId":@"0da00a1ca94d4fa0b474cbd8180e396a"} success:^(id JSON) {
//        NSLog(@"%@",JSON);
//        
//    } failure:^(NSError *error) {
//        NSLog(@"%@",error);
//
//    }];
//    
//    
//    [HttpTool postWithPath:@"app/api/user/getUserInfo" params:@{@"clientType":@1,@"userId":@"0da00a1ca94d4fa0b474cbd8180e396a"} success:^(id JSON) {
//        NSLog(@"%@",JSON);
//        
//    } failure:^(NSError *error) {
//        NSLog(@"%@",error);
//        
//    }];
    
    [HttpTool postWithPath:@"app/api/login" params:@{@"username":@"pengfeifei26@163.com",@"password":@"123456",@"clientType":@1} success:^(id JSON) {
        NSLog(@"%@=====",JSON);
        
    } failure:^(NSError *error) {
        NSLog(@"====%@",error);
        
    }];
    
    [HttpTool getWithPath:@"app/api/login?username=pengfeifei26&password=a123456&clientType=1" params:nil success:^(id JSON) {
        NSLog(@"%@=====",JSON);
    } failure:^(NSError *error) {
        
    }];
}

- (void) loadUI
{
    self.title = @"劳人记忆";
    self.view.backgroundColor = [UIColor whiteColor];
   // self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navbar_down" highlightedIcon:@"navbar_down_highlighted" target:self action:nil];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"navbar_shaixuan" highlightedIcon:@"navbar_shaixuan_highlighted" target:self action:nil];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
    self.tableView.showsHorizontalScrollIndicator = NO;//去除横向滚动条
    self.tableView.backgroundColor = kGlobalBackGroundColor;
    //self.tableView.
}
/**
 *  加载上部的图片
 */
- (void)loadTopImages
{
    if (_topImages == nil) {
        _topImages = [NSArray array];
    }
    _topImages = [NSArray arrayWithArray: [DataTool homeTopImages]];
}
/**
 *  加载活动
 */
- (void)loadActivies
{
    if(_activiesData == nil)
    {
        _activiesData = [NSMutableArray array];
    }
    NSArray *data = [DataTool activites:11111 sinceId:0 maxId:0 count:0];
    [data enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        GRActivityCellFrame *cellFrame = [[GRActivityCellFrame alloc] init];
        cellFrame.activity = obj;
        [_activiesData addObject:cellFrame];
    }];
}


#pragma mark tableview部分
//每个组的cell个数
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        //第一组 滚动cell
        return 1;
    }
    return _activiesData.count;
}

//有几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;//上半部分是滚动cell 第二组是数据cell
}
//section高度
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 5;
}
//每一行的高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [GRImageScrollCell cellHeight];
    }
    GRActivityCellFrame *frame = _activiesData[indexPath.row];

    return frame.cellHeight;
}
//加载cell
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        GRImageScrollCell *scrollCell = [[GRImageScrollCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"scrollCell"];
        scrollCell.scrollImages = _topImages;
        return scrollCell;
    }
    else
    {
        static NSString *cellId = @"activityCell";
        GRActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
         cell = [[GRActivityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        cell.cellFrame = _activiesData[indexPath.row];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MemoryDetailController *detail = [[MemoryDetailController alloc] init];
    detail.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"navbar_down" highlightedIcon:@"navbar_down_highlighted" target:self action:nil];
    [self.navigationController pushViewController:detail animated:YES];
    
    NSLog(@"pushViewController");
}


@end
