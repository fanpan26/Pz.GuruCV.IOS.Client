//
//  GRMainController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/19.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import "GRMainController.h"
#import "HomeController.h"
#import "MyController.h"
#import "HelpController.h"
#import "SettingController.h"
#import "PeopleController.h"
#import "FootController.h"
#import "GRNavigationController.h"
#import "GRDock.h"
#import "UIBarButtonItem+MJ.h"

@interface GRMainController()<UINavigationControllerDelegate>

@end
@implementation GRMainController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addChildViewControllers];
}

- (void) addChildViewNavController:(GRNavigationController *)childController
{
    childController.delegate = self;
    [self addChildViewController:childController];
}

/**
 *  添加子控制器
 */
- (void) addChildViewControllers
{
    //首页 劳人记忆
    GRNavigationController *home = [[GRNavigationController alloc] initWithRootViewController:[[HomeController alloc] init]];
    //足迹
     GRNavigationController *help = [[GRNavigationController alloc] initWithRootViewController:[[HelpController alloc] init]];
    //人物
     GRNavigationController *people = [[GRNavigationController alloc] initWithRootViewController:[[PeopleController alloc] init]];
    //我的
    //MyController *my = [[MyController alloc] init];
     GRNavigationController *my = [[GRNavigationController alloc] initWithRootViewController:[[MyController alloc] init]];
    //设置
     GRNavigationController *setting = [[GRNavigationController alloc] initWithRootViewController:[[SettingController alloc] init]];
    
    [self addChildViewNavController:home];
    [self addChildViewNavController:people];
    [self addChildViewNavController:help];
    [self addChildViewNavController:my];
    [self addChildViewNavController:setting];
    [self firstChildViewLoad];//设置第一个界面
    
}
/**
 *  导航控制器通用设置
 *
 *  @param navigationController
 *  @param viewController
 *  @param animated
 */
#pragma mark 实现导航控制器代理方法
// 导航控制器即将显示新的控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    if (![viewController isKindOfClass:[HomeController class]])
    // 如果显示的不是根控制器，就需要拉长导航控制器view的高度
    
    // 1.获得当期导航控制器的根控制器
    UIViewController *root = navigationController.viewControllers[0];
    if ([viewController isKindOfClass:[MyController class]]) {
        [navigationController setNavigationBarHidden:YES];
    }
    if (root != viewController) { // 不是根控制器
        // {0, 20}, {320, 460}
        // 2.拉长导航控制器的view
        CGRect frame = navigationController.view.frame;
        frame.size.height = [UIScreen mainScreen].applicationFrame.size.height + [UIScreen mainScreen].applicationFrame.origin.y;
        navigationController.view.frame = frame;
        
        // 3.添加Dock到根控制器的view上面
        [self.dock removeFromSuperview];
        CGRect dockFrame = self.dock.frame;
        dockFrame.origin.y = root.view.frame.size.height - self.dock.frame.size.height;
        if ([root.view isKindOfClass:[UIScrollView class]]) { // 根控制器的view是能滚动
            UIScrollView *scroll = (UIScrollView *)root.view;
            dockFrame.origin.y += scroll.contentOffset.y;
        }
        self.dock.frame = dockFrame;
        [root.view addSubview:self.dock];
        
        // 4.添加左上角的返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_back.png" highlightedIcon:@"navigationbar_back_highlighted.png" target:self action:@selector(back)];
    }
}

- (void)back
{
    [self.childViewControllers[self.dock.selectedIndex] popViewControllerAnimated:YES];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *root = navigationController.viewControllers[0];
    if (viewController == root) {
        // 1.让导航控制器view的高度还原
        CGRect frame = navigationController.view.frame;
        frame.size.height = [UIScreen mainScreen].applicationFrame.size.height - self.dock.frame.size.height + [UIScreen mainScreen].applicationFrame.origin.y;
        navigationController.view.frame = frame;
        
        // 2.添加Dock到mainView上面
        [self.dock removeFromSuperview];
        CGRect dockFrame = self.dock.frame;
        // 调整dock的y值
        dockFrame.origin.y = self.view.frame.size.height - self.dock.frame.size.height;
        self.dock.frame = dockFrame;
        [self.view addSubview:self.dock];
    }
}


@end
