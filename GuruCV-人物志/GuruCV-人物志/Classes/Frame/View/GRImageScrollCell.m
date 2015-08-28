//
//  GRImageScrollCell.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/20.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//图片滚动cell

#import "GRImageScrollCell.h"

#define kImageScrollImageHeight 150

@interface GRImageScrollCell()<UIScrollViewDelegate>{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    NSTimer *_timer;//计时器
}

@end

@implementation GRImageScrollCell

/**
 *  初始化滚动cell方法
 *
 *  @param style           类型
 *  @param reuseIdentifier 重用
 *
 *  @return 返回cell
 */
-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addScrollView];
    }
    return self;
}
/**
 *  添加scrollview
 */
- (void)addScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kImageScrollImageHeight)];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    [self.contentView addSubview:scrollView];
    _scrollView = scrollView;
}

- (void) startTimer
{
        _timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
//更新timer需要重新计算页码
- (void) updateTimer
{
    NSInteger page = (_pageControl.currentPage + 1) % _scrollImages.count;
    _pageControl.currentPage = page;
    [self pageChanged:_pageControl];
}
//开始拖拽，停止timer
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_timer invalidate];
}
//停止拖拽，开始执行timer
-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}
/**
 *  拖动完滚动视图，需要更改pagecontrol位置
 *
 *  @param scrollView
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    _pageControl.currentPage = page;
}
/**
 *  添加pagecontrol
 */
- (void) addPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = self.scrollImages.count;
    CGSize controlSize = [pageControl sizeForNumberOfPages:self.scrollImages.count];
    pageControl.bounds = CGRectMake(0, 0, controlSize.width, controlSize.height);
    pageControl.center = CGPointMake(self.center.x, 130);
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    [pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    pageControl.currentPage = 0;
    [self.contentView addSubview:pageControl];
    _pageControl = pageControl;
    
}

- (void) pageChanged:(UIPageControl *)pageControl
{
    NSInteger page = pageControl.currentPage;
    [_scrollView setContentOffset:CGPointMake(page * self.bounds.size.width, 0) animated:YES];
}


- (int)cellHeight
{
    return kImageScrollImageHeight;
}

+(int) cellHeight
{
    return kImageScrollImageHeight;
}
/**
 *  重写set方法
 *
 *  @param scrollImages 设置图片的array
 */
-(void)setScrollImages:(NSArray *)scrollImages
{
    _scrollImages = scrollImages;
    NSInteger count = scrollImages.count;
    //滚动条的宽度为总图片数目乘以个数
    _scrollView.contentSize = CGSizeMake(kScreenWidth * count, kImageScrollImageHeight);
    for (int i = 0; i < count; i ++) {
        UIImage *image = [UIImage imageNamed:scrollImages[i]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.userInteractionEnabled = YES;
        imageView.frame = CGRectMake(kScreenWidth * i, 0, kScreenWidth, kImageScrollImageHeight);
        [_scrollView addSubview:imageView];
    }
    //设置完图片后在添加并添加到contentview上
    [self addPageControl];
    [self startTimer];
}

-(void)setFrame:(CGRect)frame
{
    frame.size.width = kScreenWidth;
    frame.size.height = kImageScrollImageHeight;
    [super setFrame:frame];
}

@end
