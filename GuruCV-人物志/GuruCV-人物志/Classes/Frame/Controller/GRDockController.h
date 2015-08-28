//
//  GRDockController.h
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/19.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GRDock;
@interface GRDockController : UIViewController

@property(nonatomic,strong,readonly) GRDock *dock;

- (void) firstChildViewLoad;

@end
