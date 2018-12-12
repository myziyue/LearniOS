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
@property (weak, nonatomic) IBOutlet UILabel *sliderValue;

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
- (IBAction)touchDown:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSLog(@"选择的段：%li", segmentedControl.selectedSegmentIndex);
    
    if(self.leftSwitch.hidden) {
        self.rightSwitch.hidden = false;
        self.leftSwitch.hidden = false;
    } else {
        self.leftSwitch.hidden = true;
        self.rightSwitch.hidden = true;
    }
}
- (IBAction)sliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)(slider.value);
    NSString *newText = [[NSString alloc] initWithFormat:@"%d", progressAsInt];
    self.sliderValue.text = newText;
}
@end
