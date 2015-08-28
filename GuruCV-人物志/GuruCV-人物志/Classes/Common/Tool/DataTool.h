/* desc ：数据集中处理类
 * create：2015.8.22
 * author：fyp
 *
 */

#import <Foundation/Foundation.h>

@class GRUserContact;
@interface DataTool : NSObject

/**
 *  根据用户名片信息获取相应的table数据
 *
 *  @param contact 用户名片
 *
 *  @return 返回一个集合，集合里面有table的数据
 */
+ (NSArray *)userCardTableDataSource:(GRUserContact *)contact;

/**
 *  获取劳人记忆首页的 top滚动图片列表
 *
 *  @return 返回图片列表array
 */
+ (NSArray *)homeTopImages;


/**
 *  获取人物页面的 top滚动图片列表
 *
 *  @return 返回图片列表array
 */
+ (NSArray *)peopleTopImages;

/**
 *  首页获取文章列表
 *
 *  @param cvNumber 用户cvnumber
 *  @param count    条数
 *  @param sinceId 从哪个文章开始
 *  @param maxId 最大的id
 *  @return 返回一个文章集合
 */
+ (NSArray *)activites:(long)cvNumber sinceId:(NSUInteger)sinceId maxId:(NSUInteger)maxId count:(int) count;


+ (NSArray *)peoples;
@end
