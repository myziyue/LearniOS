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
}

-(void)switchValueChanged:(id)sender {
    UISwitch *withSwitch = (UISwitch *)sender;
    BOOL setting = withSwitch.isOn;
    [self.leftSwitch setOn:setting animated:true];
    [self.rightSwitch setOn:setting animated:true];
}


@end
