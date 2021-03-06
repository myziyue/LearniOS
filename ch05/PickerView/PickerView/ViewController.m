//
//  ViewController.m
//  PickerView
//
//  Created by MyZiyue on 2018/12/14.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;

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
