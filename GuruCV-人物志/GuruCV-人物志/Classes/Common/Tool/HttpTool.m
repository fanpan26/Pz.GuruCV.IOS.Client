//
//  HttpTool.m
//  新浪微博
//
//  Created by apple on 13-10-30.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

#define kBaseURL @"http://www.ppoint.me/pinpoint/"
//http://192.168.1.200:83/pinPoint/
@implementation HttpTool

+ (void) requestWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure method:(NSString *) method
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    //追加accesstoken参数
    NSString *accessToken = @"153cd7af82bf423895ecb5bc93c2706c";
    if (params) {
       [dic setDictionary:params];
    }
//    if (accessToken) {
//        [dic setValue:accessToken forKey:@"userToken"];
//    }
    //拼接url
    NSString  *url = [kBaseURL stringByAppendingString:path];
    NSString *encodingUrl =[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if ([method.lowercaseString isEqualToString:@"get"]) {
        [manager GET:encodingUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            success(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            if (failure!=nil) {
                failure(error);
            }
        }];
    }else{
        [manager POST:encodingUrl parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            success(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure !=nil) {
                failure(error);
            }
        }];
    }
    
}
/**
 *  get方法
 *
 *  @param path    路径
 *  @param params  参数 dictionary
 *  @param success 成功回调
 *  @param failure 失败回调
 */

+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    return [self requestWithPath:path params:params success:success failure:failure method:@"get"];
}
/**
 *  Post方法
 *
 *  @param path    路径
 *  @param params  参数 dictionary
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    return [self requestWithPath:path params:params success:success failure:failure method:@"post"];
}

+ (void)downloadImage:(NSString *)url place:(UIImage *)place imageView:(UIImageView *)imageView
{
    [imageView setImageWithURL:[NSURL URLWithString:url] placeholderImage:place options:SDWebImageLowPriority | SDWebImageRetryFailed];
}
@end