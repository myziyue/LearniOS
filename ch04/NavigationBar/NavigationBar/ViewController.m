//
//  ViewController.m
//  NavigationBar
//
//  Created by MyZiyue on 2018/12/13.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)save:(id)sender {
    self.label.text = @"点击Save";
}

- (IBAction)add:(id)sender {
    self.label.text = @"点击Add";
}

@end
