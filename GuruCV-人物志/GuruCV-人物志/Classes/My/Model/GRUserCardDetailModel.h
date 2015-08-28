//
//  GRUserCardDetailModel.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/22.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
// tableview每一行

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, GRCardEditType) {
    GRCardEditTypeText,// 简单文本编辑
    GRCardEditTypeTags,//编辑标签
    GRCardEditTypeValidate,//需要验证
    GRCardEditTypePhoto//头像编辑
};

@interface GRUserCardDetailModel : NSObject

@property(nonatomic,copy) NSString *cardkey;
@property(nonatomic,copy) NSString *cardValue;
@property(nonatomic,copy) NSString *cardOther;
@property(nonatomic,copy) NSString *cardImage;
@property(nonatomic,assign) GRCardEditType cardEditType;

- (instancetype) initWithKey:(NSString *) key value:(NSString *)value;

- (instancetype) initWithKey:(NSString *)key value:(NSString *)value other:(NSString *)other;

- (instancetype) initWithKey:(NSString *)key value:(NSString *)value other:(NSString *)other image:(NSString *)image;

@end
