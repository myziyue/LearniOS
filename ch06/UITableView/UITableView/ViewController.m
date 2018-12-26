//
//  ViewController.m
//  UITableView
//
//  Created by MyZiyue on 2018/12/26.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray* listTeams;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle* bundle = [NSBundle mainBundle];
    NSString* plistPath = [bundle pathForResource:@"team" ofType:@"plist"];
    self.listTeams = [[NSArray alloc] initWithContentsOfFile:plistPath];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listTeams count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    NSUInteger row = [indexPath row];
    
    NSDictionary* rowDict = self.listTeams[row];
    cell.textLabel.text = rowDict[@"name"];
    
    NSString* imagePath = [[NSString alloc] initWithFormat:@"%@.png", rowDict[@"image"]];
    cell.imageView.image = [UIImage imageNamed:imagePath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
