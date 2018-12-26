//
//  ViewController.m
//  UITableView1
//
//  Created by MyZiyue on 2018/12/26.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

#define CellIdentifier @"CellIdentifier"

@interface ViewController ()

@property (nonatomic, strong) NSArray* listTeams;
@property (nonatomic, strong) UITableView* tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle* bundle = [NSBundle mainBundle];
    NSString* plistPath = [bundle pathForResource:@"team" ofType:@"plist"];
    
    self.listTeams = [[NSArray alloc] initWithContentsOfFile: plistPath];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listTeams count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    
    NSDictionary* rowDict = self.listTeams[row];
    cell.textLabel.text = rowDict[@"name"];
    
    NSString* imagePath = [[NSString alloc] initWithFormat:@"%@.png", rowDict[@"image"]];
    cell.imageView.image = [UIImage imageNamed:imagePath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
