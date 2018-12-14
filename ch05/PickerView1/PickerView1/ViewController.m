//
//  ViewController.m
//  PickerView1
//
//  Created by MyZiyue on 2018/12/14.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()  <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) IBOutlet UILabel *label;

@property (nonatomic, strong) NSDictionary* pickerData;
@property (nonatomic, strong) NSArray* pickerProvincesData;
@property (nonatomic, strong) NSArray* pickerCitiesData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle* bundle = [NSBundle mainBundle];
    NSString* plistPath = [bundle pathForResource:@"provinces_cities" ofType:@"plist"];
    //获取属性列表文件中的全部数据
    NSDictionary* dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.pickerData = dict;
    // 省份名数据
    self.pickerProvincesData = [self.pickerData allKeys];
    // 默认取出第一个省的所有市的数据
    NSString* selectedProvince = [self.pickerProvincesData objectAtIndex:0];
    self.pickerCitiesData = [self.pickerData objectForKey:selectedProvince];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    // 1. 选择器
    CGFloat pickerViewWidth = 320;
    CGFloat pickerViewHeight = 162;
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 60, pickerViewWidth, pickerViewHeight)];
    [self.view addSubview:self.pickerView];
    
    // 2. 添加标签
    CGFloat labelWidth = 200;
    CGFloat labelHeight = 21;
    CGFloat labelTopView = 273;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width - labelWidth)/2, labelTopView, labelWidth, labelHeight)];
    self.label.text = @"Label";
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    // 3. Button按钮
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    
    CGFloat buttonWidth = 46;
    CGFloat buttonHeight = 30;
    CGFloat buttonTopView = 374;
    
    button.frame = CGRectMake((screen.size.width - buttonWidth)/2, buttonTopView, buttonWidth, buttonHeight);
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
}

- (IBAction)onClick:(id)sender {
    NSInteger row1 = [self.pickerView selectedRowInComponent:0];
    NSInteger row2 = [self.pickerView selectedRowInComponent:1];
    NSString* selected1 = [self.pickerProvincesData objectAtIndex:row1];
    NSString* selected2 = [self.pickerCitiesData objectAtIndex:row2];
    
    NSString* title = [[NSString alloc] initWithFormat:@"%@, %@市",selected1,selected2];
    
    self.label.text = title;
}

// 实现协议UIPickerDataSource方法
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(component == 0) { // 省份个数
        return [self.pickerProvincesData count];
    } else {
        return [self.pickerCitiesData count];
    }
}
// 实现协议UIPickerDelegate方法
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(component == 0 ) {
        return [self.pickerProvincesData objectAtIndex:row];
    } else {
        return [self.pickerCitiesData objectAtIndex:row];
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(component == 0) {
        NSString* selectedProvince = [self.pickerProvincesData objectAtIndex:row];
        NSArray* array = [self.pickerData objectForKey:selectedProvince];
        self.pickerCitiesData = array;
        [self.pickerView reloadComponent:1];
        [self.pickerView selectRow:0 inComponent:1 animated:true];
    }
}

@end
