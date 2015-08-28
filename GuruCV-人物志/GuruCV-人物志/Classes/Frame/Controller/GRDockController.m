//
//  GRDockController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/19.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRDockController.h"
#import "GRDock.h"

@interface GRDockController()<GRDockDelegate>

@end
@implementation GRDockController


-(void)viewDidLoad
{
    [super viewDidLoad];
    //清除背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    //添加dock
    [self addDock];
}

/**
 *  添加dock
 */
-(void) addDock
{
    GRDock *dock = [[GRDock alloc] init];
    dock.frame = CGRectMake(0,self.view.frame.size.height - kDockHeight, 0, 0);
    dock.delegate = self;
    [self.view addSubview:dock];
    _dock = dock;
}

- (void)dock:(GRDock *)dock didClickedMenuAtIndex:(int)endIndex fromIndex:(int)startIndex
{
    if(endIndex < 0 ||endIndex >= self.childViewControllers.count) return;
    UIViewController *oldController = self.childViewControllers[startIndex];
    //移除旧的
    [oldController.view removeFromSuperview];
    
    //添加新的
    UIViewController *newController = self.childViewControllers[endIndex];
    newController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - kDockHeight);
    [self.view addSubview:newController.view];

}

- (void)firstChildViewLoad
{
    if (self.childViewControllers.count) {
        UIViewController *newController = self.childViewControllers[0];
        newController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - kDockHeight);
        [self.view addSubview:newController.view];
    }
}

@end
