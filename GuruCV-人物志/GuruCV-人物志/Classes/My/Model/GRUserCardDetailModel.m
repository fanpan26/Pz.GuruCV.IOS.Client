//
//  GRUserCardDetailModel.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/22.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRUserCardDetailModel.h"

@implementation GRUserCardDetailModel

- (instancetype)initWithKey:(NSString *)key value:(NSString *)value
{
    if (self = [super init]) {
        _cardkey = key;
        _cardValue = value;
    }
    return self;
}

- (instancetype)initWithKey:(NSString *)key value:(NSString *)value other:(NSString *)other
{
    if (self = [self initWithKey:key value:value]) {
        _cardOther = other;
    }
    return self;
}

- (instancetype) initWithKey:(NSString *)key value:(NSString *)value other:(NSString *)other image:(NSString *)image
{
    if (self = [self initWithKey:key value:value other:other]) {
        _cardImage = image;
    }
    return self;
}

@end
