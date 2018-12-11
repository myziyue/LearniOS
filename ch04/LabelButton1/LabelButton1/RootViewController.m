//
//  RootViewController.m
//  LabelButton1
//
//  Created by MyZiyue on 2018/12/11.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat labelWidth = 90;
    CGFloat labelHeight = 20;
    CGFloat labelTopView = 150;
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width - labelWidth)/2, labelTopView, labelWidth, labelHeight)];
    
    label.text = @"Label";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"OK" forState:UIControlStateNormal];
    
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = 20;
    CGFloat buttonTopView = 240;
    
    button.frame = CGRectMake((screen.size.width - buttonWidth)/2, buttonTopView, buttonWidth, buttonHeight);
    
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)onClick:(id)sender {
    NSLog(@"OK Button onClick");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
