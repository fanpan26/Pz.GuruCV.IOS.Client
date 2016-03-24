//
//  SettingController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/19.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "SettingController.h"
#import "GRImageScrollCell.h"

@implementation SettingController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"关于";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"退出登录" style:UIBarButtonItemStylePlain target:nil action:nil];
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        GRImageScrollCell *cell = [[GRImageScrollCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        NSArray *imageArray = [NSArray arrayWithObjects:@"img_01",@"img_02",@"img_03",@"img_04",@"img_05", nil];
        cell.scrollImages = imageArray;
        return cell;
       
    }else{
        UITableViewCell *cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell1.textLabel.text = @"按班级";
        cell1.accessoryView = [[UISwitch alloc] init];
        UIImage *image = [UIImage imageNamed:@"icon_shu"];
        cell1.imageView.image = image;
        cell1.detailTextLabel.text = @"1fdfdfdf1122222";
        return cell1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 0) {
        return 44;
    }
    return 150;
}
@end
