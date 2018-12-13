//
//  ViewController.m
//  Toolbar1
//
//  Created by MyZiyue on 2018/12/13.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat toolbarHeight = 44;
    
    // 1. toolbar
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, screen.size.height-toolbarHeight, screen.size.width, toolbarHeight)];
    
    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    UIBarButtonItem *openButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Open" style:UIBarButtonItemStylePlain target:self action:@selector(open:)];
    UIBarButtonItem *flexibleButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    toolbar.items = @[saveButtonItem, flexibleButtonItem, openButtonItem];
    [self.view addSubview:toolbar];
    
    // 2. label
    CGFloat labelWidth = 84;
    CGFloat labelHeight = 21;
    CGFloat labelTopView = 250;
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width - labelWidth)/2, labelTopView, labelWidth, labelHeight)];
    self.label.text = @"Label";
    // 字体左右居中
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
}

-(void)save:(id)sender {
    self.label.text = @"点击Save";
}

-(void)open:(id)sender {
    self.label.text = @"点击Open";
}
@end
