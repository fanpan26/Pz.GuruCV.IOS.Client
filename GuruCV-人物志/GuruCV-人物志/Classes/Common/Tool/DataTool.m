//
//  DataTool.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/22.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "DataTool.h"
#import "GRUserCardDetailModel.h"
#import "GRUserCardListModel.h"
#import "GRUserContact.h"
#import "GRActivityModel.h"
#import "GRUser.h"
#import "GRUserPeople.h"

@implementation DataTool

/**
 *  根据用户的联系方式，名片model获取绑定table的model
 *
 *  @param contact 用户名片model
 *
 *  @return 返回数据源table
 */
+(NSArray *) userCardTableDataSource:(GRUserContact *)contact
{
    NSMutableArray *array = [NSMutableArray array];
    if (contact.cvNumber > 0) {
        //基本信息
        GRUserCardListModel *model = [[GRUserCardListModel alloc] init];
        model.cardCategoryName = @"基本信息";

        //头像
        GRUserCardDetailModel *photo = [[GRUserCardDetailModel alloc] initWithKey:@"照  片" value:nil other:nil image:contact.headPhotos];
        photo.cardEditType = GRCardEditTypePhoto;
        //姓名
        GRUserCardDetailModel *name = [[GRUserCardDetailModel alloc] initWithKey:@"姓  名" value:contact.name];
        name.cardEditType = GRCardEditTypeText;
        //公司
        GRUserCardDetailModel *company = [[GRUserCardDetailModel alloc] initWithKey:@"现单位" value:contact.company];
        company.cardEditType = GRCardEditTypeText;
        //职位
        GRUserCardDetailModel *position = [[GRUserCardDetailModel alloc] initWithKey:@"现职位" value:contact.position];
        position.cardEditType = GRCardEditTypeText;
        //成就
        GRUserCardDetailModel *achieve = [[GRUserCardDetailModel alloc] initWithKey:@"成  就" value:contact.achieveTags];
        achieve.cardEditType = GRCardEditTypeTags;
        //能力
        GRUserCardDetailModel *ability = [[GRUserCardDetailModel alloc] initWithKey:@"能  力" value:contact.abilityTags];
        ability.cardEditType = GRCardEditTypeTags;
        model.cardDetails = [NSArray arrayWithObjects:photo,name,company,position,achieve,ability, nil];
        [array addObject:model];
        
        //联系方式
        //基本信息
        GRUserCardListModel *model1 = [[GRUserCardListModel alloc] init];
        model1.cardCategoryName = @"联系方式";
        
        //手机
        GRUserCardDetailModel *mobile = [[GRUserCardDetailModel alloc] initWithKey:@"手  机" value:contact.mobile];
        mobile.cardEditType = GRCardEditTypeValidate;
        //邮箱
        GRUserCardDetailModel *mail = [[GRUserCardDetailModel alloc] initWithKey:@"邮  箱" value:contact.mail];
        mail.cardEditType = GRCardEditTypeText;
        //微信
        GRUserCardDetailModel *weixin = [[GRUserCardDetailModel alloc] initWithKey:@"微  信" value:contact.wechat];
        weixin.cardEditType = GRCardEditTypeText;
        //座机
        GRUserCardDetailModel *landline = [[GRUserCardDetailModel alloc] initWithKey:@"座  机" value:contact.landline];
        landline.cardEditType = GRCardEditTypeText;
        //联系地址
        GRUserCardDetailModel *address = [[GRUserCardDetailModel alloc] initWithKey:@"地  址" value:contact.address];
        address.cardEditType = GRCardEditTypeText;
        model1.cardDetails = [NSArray arrayWithObjects:mobile,mail,weixin,landline,address, nil];
        [array addObject:model1];
        
    }
    NSLog(@"%@",array);
    return array;
}

+(NSArray *)homeTopImages
{
    NSArray *imageArray = [NSArray arrayWithObjects:@"img_01",@"img_02",@"img_03",@"img_04",@"img_05", nil];

    return imageArray;
}

+(NSArray *)peopleTopImages
{
    NSArray *imageArray = [NSArray arrayWithObjects:@"img_01",@"img_02",@"img_03",@"img_04",@"img_05", nil];
    return imageArray;
}

+ (NSArray *) activites:(long)cvNumber sinceId:(NSUInteger)sinceId maxId:(NSUInteger)maxId count:(int)count
{
    NSMutableArray *array = [NSMutableArray array];
    GRActivityModel *activity ;
    for (int i = 0; i < 20; i ++) {
        activity = [[GRActivityModel alloc] initWithDict:nil];
        [array addObject:activity];
    }
    return array;
}
+ (NSArray *)peoples
{
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i < 20; i ++) {
        GRUserPeople *people = [[GRUserPeople alloc] init];
        people.position = @"研发工程师";
        people.company = @"天才在线科技有限公司";
        people.name = @"范月盘";
        people.major = @"计算机科学与技术";
        people.grade = @"08级";
        people.studyLevel = @"本科";
        people.desc = @"毕业于山东中医药大学，先后就职于学科网，天才在线科技有限公司，是一名.net研发程序员，目前从事webapp的研发工作";
        [arrayM addObject:people];
    }
    return arrayM;
}
@end
