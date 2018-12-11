//
//  ViewController.m
//  TextFieldTextView1
//
//  Created by MyZiyue on 2018/12/11.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat textFieldWidth = 223;
    CGFloat textFieldHeight = 30;
    CGFloat textFieldTopView = 150;
    
    UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake((screen.size.width - textFieldWidth)/2, textFieldTopView, textFieldWidth, textFieldHeight)];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    
    [self.view addSubview:textField];
    
    // labelName标签与TextFieldj之间的距离
    CGFloat labelNameTextFieldSpace = 30;
    UILabel* labelName = [[UILabel alloc] initWithFrame:CGRectMake(textField.frame.origin.x, textField.frame.origin.y - labelNameTextFieldSpace, 51, 21)];
    
    labelName.text = @"Name:";
    [self.view addSubview:labelName];
    
    CGFloat textViewWidth = 236;
    CGFloat textViewHeight = 198;
    CGFloat textViewTopView = 240;
    UITextView* textView = [[UITextView alloc] initWithFrame:CGRectMake((screen.size.width - textViewWidth)/2, textViewTopView, textViewWidth, textViewHeight)];
    
    textView.text = @"Lorem ipsum dolor sit er elit lamet, ...";
    textView.delegate = self;
    
    [self.view addSubview:textView];
    
    // labelName标签与TextField之间的距离
    CGFloat labelAbstractTextViewSpace = 30;
    UILabel* labelAbstract = [[UILabel alloc] initWithFrame:CGRectMake(textView.frame.origin.x, textView.frame.origin.y - labelAbstractTextViewSpace, 103, 21)];
    labelAbstract.text = @"Abstract:";
    
    [self.view addSubview:labelAbstract];
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

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"TextField获得焦点, 点击Return按键");
    [textField resignFirstResponder];
    return TRUE;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(nonnull NSString *)text{
    if([text isEqualToString:@"\n"]){
        NSLog(@"TextView获得焦点, 点击Return按键");
        [textView resignFirstResponder];
        return FALSE;
    }
    return TRUE;
}

@end
