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


@end
