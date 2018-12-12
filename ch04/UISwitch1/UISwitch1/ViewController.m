//
//  ViewController.m
//  UISwitch1
//
//  Created by MyZiyue on 2018/12/12.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UISwitch *rightSwitch;
@property (strong, nonatomic) UISwitch *leftSwitch;
@property (strong, nonatomic) UILabel *sliderValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    // 1. 添加rightSwitch控件
    // rightSwitch与屏幕左边距
    // lefitSwitch与屏幕右边距
    CGFloat switchScreenSpace = 39;
    
    self.rightSwitch = [[UISwitch alloc] init];
    CGRect frame = self.rightSwitch.frame;
    frame.origin = CGPointMake(switchScreenSpace, 98);
    // 重新设置控件的位置
    self.rightSwitch.frame = frame;
    // 设置控件状态
    self.rightSwitch.on = true;
    // 指定事件处理方法
    [self.rightSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.rightSwitch];
    
    // 2.添加leftSwitch控件
    self.leftSwitch = [[UISwitch alloc] init];
    frame = self.leftSwitch.frame;
    frame.origin = CGPointMake(screen.size.width - (frame.size.width + switchScreenSpace), 98);
    // 重新设置控件的位置
    self.leftSwitch.frame = frame;
    // 设置控件状态
    self.leftSwitch.on = true;
    // 指定事件处理方法
    [self.leftSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.leftSwitch];
    
    // 3.添加segmentedControl控件
    NSArray* segments = @[@"Left", @"Right"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:segments];
    
    CGFloat scWidth = 220;
    CGFloat scHeight = 29;
    CGFloat scTopView = 186;
    frame = CGRectMake((screen.size.width - scWidth)/2, scTopView, scWidth, scHeight);
    // 重新设置控件的位置
    segmentedControl.frame = frame;
    // 设置控件状态
    segmentedControl.selectedSegmentIndex = 0;
    // 指定事件处理方法
    [segmentedControl addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segmentedControl];
    
    // 4.添加slider控件
    CGFloat sliderWidth = 300;
    CGFloat sliderHeight = 31;
    CGFloat sliderTopView = 298;
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake((screen.size.width - sliderWidth)/2, sliderTopView, sliderWidth, sliderHeight)];
    
    slider.minimumValue = 0.0f;
    slider.maximumValue = 100.0f;
    slider.value = 50.0f;
    
    // 指定事件处理方法
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    // 5.添加SliderValue：标签
    // Slider Value: 标签与slider之间的距离
    CGFloat labelSliderValueSliderSpace = 30;
    UILabel *labelSliderValue = [[UILabel alloc] initWithFrame:CGRectMake(slider.frame.origin.x, slider.frame.origin.y - labelSliderValueSliderSpace, 103, 21)];
    labelSliderValue.text = @"Slider Value:";
    [self.view addSubview:labelSliderValue];
    
    // 6.添加SliderValue标签
    self.sliderValue = [[UILabel alloc] initWithFrame:CGRectMake(labelSliderValue.frame.origin.x + 120, labelSliderValue.frame.origin.y, 50, 21)];
    self.sliderValue.text = @"50";
    [self.view addSubview:self.sliderValue];
}

-(void)switchValueChanged:(id)sender {
    UISwitch *withSwitch = (UISwitch *)sender;
    BOOL setting = withSwitch.isOn;
    [self.leftSwitch setOn:setting animated:true];
    [self.rightSwitch setOn:setting animated:true];
}

-(void)touchDown:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSLog(@"选择的段：%li", segmentedControl.selectedSegmentIndex);
    
    if(self.leftSwitch.hidden){
        self.leftSwitch.hidden = false;
        self.rightSwitch.hidden = false;
    } else {
        self.leftSwitch.hidden = true;
        self.rightSwitch.hidden = true;
    }
}

-(void)sliderValueChanged:(id)sender{
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)(slider.value);
    NSString *newText = [[NSString alloc]initWithFormat:@"%d", progressAsInt];
    NSLog(@"滑块的值：%@", newText);
    self.sliderValue.text = newText;
}


@end
