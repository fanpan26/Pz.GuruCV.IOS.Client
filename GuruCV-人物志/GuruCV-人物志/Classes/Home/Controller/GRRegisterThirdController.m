//
//  GRRegisterThirdController.m
//  GuruCV-人物志
//
//  Created by FanYuepan on 15/8/25.
//  Copyright (c) 2015年 FanYuepan. All rights reserved.
//  注册页面第三步

#import "GRRegisterThirdController.h"
#import "NSString+GR.h"
#import "GRCommonTextField.h"
#import "GRSelectSchoolInfoView.h"

@interface GRRegisterThirdController ()<GRSelectSchoolInfoViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    UIPickerView *_pickView;
    NSArray *_years;
    NSArray *_studyLevel;
    NSArray *_majors;
    GRSelectSchoolInfoView *_yearView;
    GRSelectSchoolInfoView *_proView;
    NSString *_selectedType ;
}
@end

@implementation GRRegisterThirdController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

- (NSArray *) years
{
    if (_years == nil) {
        _years = [NSArray arrayWithObjects:@"82 级",@"83 级",@"84 级",@"85 级",@"86 级",@"87 级",@"88 级",@"88 级",@"90 级",@"91 级",@"92 级",@"93 级",@"94 级",@"95 级",@"96 级",@"97 级",@"98 级",@"99 级",@"00 级",@"01 级",@"02 级",@"03 级",@"04 级",@"05 级",@"06 级",@"07 级",@"08 级",@"09 级",@"10 级",@"11 级",@"12 级",@"13 级",@"14 级",@"15 级", nil];
    }
    return _years;
}

- (NSArray *)studyLevel
{
    if (_studyLevel == nil) {
        _studyLevel  = [NSArray arrayWithObjects:@"本科",@"硕士",@"博士",@"在职研究生", nil];
    }
    return _studyLevel;
}

-(NSArray *)majors
{
    if (_majors == nil) {
        NSMutableArray *arrayM = [NSMutableArray array];
        NSArray *array1 = [NSArray arrayWithObjects:@"劳动经济学",@"人力资源管理",@"劳动经济学（劳动关系方向）", nil];
        NSArray *array2 = [NSArray arrayWithObjects:@"劳动经济学",@"劳动关系学",@"人力资源管理",@"社会保障", nil];
        NSArray *array3= [NSArray arrayWithObjects:@"劳动经济学",@"劳动关系学",@"人力资源管理",@"社会保障", nil];
        NSArray *array4 = [NSArray arrayWithObjects:@"人力资源管理", nil];
        [arrayM addObject:array1];
        [arrayM addObject:array2];
        [arrayM addObject:array3];
        [arrayM addObject:array4];
        _majors = [NSArray arrayWithArray:arrayM];
    }
    return _majors;
}



- (void)buildUI
{
    self.title = @"劳人记忆";
    //label提示
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.font = kBusinessCommonFont;
    tipLabel.textColor = kColor(151, 151, 151);
    NSString *text =  @"最后，请您留下您在学院最重要的经历吧";
    tipLabel.text = text;
    CGSize tipSize = [NSString sizeWithString:text font:tipLabel.font];
    tipLabel.frame = CGRectMake(10, 80,  tipSize.width, tipSize.height);
    [self.view addSubview:tipLabel];
    
    // 姓名
    GRCommonTextField *nameText = [[GRCommonTextField alloc] init];
    nameText.frame = CGRectMake(10, CGRectGetMaxY(tipLabel.frame) + 10, 0, 0);
    nameText.placeholder = @"姓名";
    [self.view addSubview:nameText];
    
    //选择 入学年份
    GRSelectSchoolInfoView *infoView = [[GRSelectSchoolInfoView alloc] init];
    infoView.frame = CGRectMake(10, CGRectGetMaxY(nameText.frame) + 10, 0, 0);
    [infoView setPlaceHolder:@"入学年份"];
    infoView.type = @"year";
    infoView.delegate = self;
    [self.view addSubview: infoView];
    _yearView = infoView;
    //选择专业
    GRSelectSchoolInfoView *profressionView = [[GRSelectSchoolInfoView alloc] init];
    profressionView.frame = CGRectMake(10, CGRectGetMaxY(infoView.frame) + 10, 0, 0);
    [profressionView setPlaceHolder:@"所学专业"];
    profressionView.type = @"professonal";
    profressionView.delegate = self;
    [self.view addSubview: profressionView];
    _proView = profressionView;
    
    //登录框
    UIButton *loginBtn = [[UIButton alloc] init];
    CGFloat loginBtnX = 10;
    CGFloat loginBtnY = CGRectGetMaxY(profressionView.frame) + kLoginMargin * 4;
    CGFloat loginBtnWidth = self.view.frame.size.width - 2 * loginBtnX;
    loginBtn.frame = CGRectMake(loginBtnX , loginBtnY, loginBtnWidth , 40);
    [loginBtn setTitle:@"完 成" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.backgroundColor = kColor(157,0,32);
  //  [loginBtn addTarget:self action:@selector(registerNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}

//点击
-(void)grSelectViewDidTapped:(GRSelectSchoolInfoView *)grSelectView
{
    if (_pickView == nil) {
        UIPickerView *picker = [[UIPickerView alloc] init];
        picker.frame = CGRectMake(0, self.view.frame.size.height - 162, self.view.frame.size.width, 162);
        picker.delegate = self;
        picker.dataSource = self;
        
        [self.view addSubview:picker];
        _pickView = picker;
    }
    _selectedType = grSelectView.type;//当前选中的状态
    [_pickView reloadAllComponents];
}
//几列

-(CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (![_selectedType isEqualToString:@"year"]) {
        return component == 0 ?100 : 220;
    }
    return  self.view.frame.size.width;
}
 - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return  [_selectedType isEqualToString:@"year"] ? [self years].count :[self studyLevel].count;
    }else{
        NSInteger first = [_pickView selectedRowInComponent:0];
        return [[self majors][first] count];
    }
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return  [_selectedType isEqualToString:@"year"] ? 1 : 2;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        if ([_selectedType isEqualToString:@"year"]) {
            return [self years][row];
        }else
        {
            return [self studyLevel][row];
        }
    }else{
        NSInteger firstIndex = [_pickView selectedRowInComponent:0];
        return [[self majors][firstIndex] objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([_selectedType isEqualToString:@"year"]) {
        NSString *year = [self years][row];
        [_yearView setPlaceHolder:year color:[UIColor blackColor]];
    }
    else{
        if (component == 0) {
            [_pickView reloadComponent:1];
        }
        else{
            NSInteger first = [_pickView selectedRowInComponent:0];
            NSInteger second = [_pickView selectedRowInComponent:1];
            NSLog(@"%@,%@",[self studyLevel][first],[self majors][first][second]);
            [_proView setPlaceHolder:[NSString stringWithFormat:@"%@ %@",[self studyLevel][first],[self majors][first][second]] color:[UIColor blackColor]];
        }
    }
}





@end
