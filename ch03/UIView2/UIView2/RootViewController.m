//
//  RootViewController.m
//  UIView2
//
//  Created by MyZiyue on 2018/12/10.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建视图viewA
    UIView* viewA = [[UIView alloc] init];
    viewA.backgroundColor = [UIColor grayColor];
    // 设置viewA的frame属性
    viewA.frame = CGRectMake(0, 0, 300, 400);
    //将viewA添加到根视图中
    [self.view addSubview:viewA];
    
    // 创建视图viewB
    UIView* viewB = [[UIView alloc] init];
    viewB.backgroundColor = [UIColor blueColor];
    // 设置viewB的frame属性
    viewB.frame = CGRectMake(50, 10, 100, 200);
    //将viewB添加到viewA视图中
    [viewA addSubview:viewB];
    
    NSLog(@"frame_x: %.2f, frame_y: %.2f", viewB.frame.origin.x, viewB.frame.origin.y);
    NSLog(@"frame_w: %.2f, frame_h: %.2f", viewB.frame.size.width, viewB.frame.size.height);
    
    NSLog(@"bounds_x: %.2f, bounds_y: %.2f", viewB.bounds.origin.x, viewB.bounds.origin.y);
    NSLog(@"bounds_w: %.2f, bounds_h: %.2f", viewB.bounds.size.width, viewB.bounds.size.height);
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
