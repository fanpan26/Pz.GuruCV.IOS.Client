//
//  GRNavigationController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/19.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRNavigationController.h"

@implementation GRNavigationController


+ (void) initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    
    //[bar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    [bar setTitleTextAttributes:@{
                                  NSForegroundColorAttributeName:[UIColor blackColor]
                                  }];
    
    UIBarButtonItem *btnItem = [UIBarButtonItem appearance];
//    [btnItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [btnItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//    
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName:[UIColor darkGrayColor],
                           NSFontAttributeName:kBarButtonItemFont
                           };
    [btnItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    [btnItem setTitleTextAttributes:dict forState:UIControlStateHighlighted];
    //设定状态栏
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
}
@end
