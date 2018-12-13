//
//  ViewController.m
//  AlertView
//
//  Created by MyZiyue on 2018/12/12.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    // 1. AlertView
    UIButton* buttonAlertView = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonAlertView setTitle:@"Test警告框" forState: UIControlStateNormal];
    
    CGFloat buttonAlertViewWidth = 100;
    CGFloat buttonAlertViewHeight = 30;
    CGFloat buttonAlertViewTopView = 30;
    
    buttonAlertView.frame = CGRectMake((screen.size.width - buttonAlertViewWidth)/2, buttonAlertViewTopView, buttonAlertViewWidth, buttonAlertViewHeight);
    // 指定事件处理方法
    [buttonAlertView addTarget:self action:@selector(testAlertView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonAlertView];
    
    // 2. AlertViewSheet
    UIButton* buttonActionSheet = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonActionSheet setTitle:@"Test操作表" forState:UIControlStateNormal];
    
    CGFloat buttonActionSheetWidth = 100;
    CGFloat buttonActionSheetHeight = 30;
    CGFloat buttonActionSheetTopView = 260;
    
    buttonActionSheet.frame = CGRectMake((screen.size.width - buttonActionSheetWidth)/2, buttonActionSheetTopView, buttonActionSheetWidth, buttonActionSheetHeight);
    // 指定事件处理方法
    [buttonActionSheet addTarget:self action:@selector(testActionSheet:) forControlEvents:UIControlEventTouchUpInside];;
    [self.view addSubview:buttonActionSheet];
}

-(void)testAlertView:(id)sender {
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Alert text goes here" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Tap No Button");
    }];
    
    UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Tap Yes Button");
    }];
    
    [alertController addAction:noAction];
    [alertController addAction:yesAction];
    
    // 显示
    [self presentViewController:alertController animated:true completion: nil];
}

-(void)testActionSheet:(id)sender {
    UIAlertController* alertControllerSheet = [[UIAlertController alloc] init];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Tap Cancel Button");
    }];
    UIAlertAction* destructionAction = [UIAlertAction actionWithTitle:@"Destruction" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Tap Destruction Button");
    }];
    UIAlertAction* otherAction = [UIAlertAction actionWithTitle:@"Others" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Tap Others Button");
    }];
    
    [alertControllerSheet addAction:cancelAction];
    [alertControllerSheet addAction:destructionAction];
    [alertControllerSheet addAction:otherAction];
    
    [self presentViewController:alertControllerSheet animated:true completion:nil];
}

@end
