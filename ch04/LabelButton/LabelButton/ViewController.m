//
//  ViewController.m
//  LabelButton
//
//  Created by MyZiyue on 2018/12/10.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onClick:(id)sender {
    NSLog(@"OK Button onClick");
    self.label.text = @"HelloWorld";
}
@end
