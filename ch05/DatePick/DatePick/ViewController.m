//
//  ViewController.m
//  DatePick
//
//  Created by MyZiyue on 2018/12/13.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onClick:(id)sender {
    NSDate* theDate = self.datePicker.date;
    NSLog(@"The date picked is : %@", [theDate descriptionWithLocale:[NSLocale currentLocale]]);
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSLog(@"The date fromate is : %@", [dateFormatter stringFromDate:theDate]);
    
    self.label.text = [dateFormatter stringFromDate:theDate];
}

@end
