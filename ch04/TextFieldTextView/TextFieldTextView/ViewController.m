//
//  ViewController.m
//  TextFieldTextView
//
//  Created by MyZiyue on 2018/12/11.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate,UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)didReceiveMemoryWarnin {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated{
    // 注册键盘出现通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidHideNotification object:nil];
    // 注册键盘隐藏通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    // 注销键盘出现通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name: UIKeyboardDidShowNotification object:nil];
    // 注销键盘隐藏通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    [super viewWillDisappear:animated];
}

-(void)keyboardDidShow: (NSNotification *)notif {
    NSLog(@"键盘打开");
}

-(void)keyboardDidHide: (NSNotification *)notif {
    NSLog(@"键盘关闭");
}


// 实现UITextFieldDelegate委托协议方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"TextField获得焦点，点击Return按键");
    [textField resignFirstResponder];
    return true;
}
// 实现UITextViewDelegate委托协议方法
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(nonnull NSString *)text {
    if([text isEqualToString:@"\n"]) {
        NSLog(@"TextView获得焦点，点击Return按键");
        [textView resignFirstResponder];
        return false;
    }
    return true;
}

@end
