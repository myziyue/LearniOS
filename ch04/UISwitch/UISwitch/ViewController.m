//
//  ViewController.m
//  UISwitch
//
//  Created by MyZiyue on 2018/12/12.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)switchValueChanged:(id)sender {
    UISwitch *withSwitch = (UISwitch *)sender;
    BOOL setting = withSwitch.isOn;
    [self.leftSwitch setOn:setting animated:TRUE];
    [self.rightSwitch setOn:setting animated:FALSE];
}

@end
