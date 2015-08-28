//
//  UserCardTextEditController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/22.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
// 普通文本编辑

#import "UserCardTextEditController.h"
#import "GRCommonTextField.h"

@interface UserCardTextEditController ()
{
   //__weak
    GRCommonTextField *_willEditTextField;//将要编辑的文本框
   // NSString *_willEditValue;//将要编辑的内容
    NSString *_willEditTitle;
}
@end

@implementation UserCardTextEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

//建设ui
- (void) buildUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    //添加textbox
    if (_willEditTextField == nil) {
        GRCommonTextField *field = [[GRCommonTextField alloc] init];
        field.frame = CGRectMake(10, 80, 0,0);
        [self.view addSubview:field];
        _willEditTextField = field;
    }
    _willEditTextField.text = _willEditValue;
  
    //添加右边的保存
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.title = _willEditTitle;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithTitle:(NSString *)title value:(NSString *)value
{
    if (self = [super init]) {
        _willEditTitle = title;
        _willEditValue = value;
    }
    return self;
}

@end
