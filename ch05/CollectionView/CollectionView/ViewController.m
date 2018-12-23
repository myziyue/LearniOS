//
//  ViewController.m
//  CollectionView
//
//  Created by MyZiyue on 2018/12/14.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"
#import "EventCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
{
    int COL_NUM;
}
@property (strong, nonatomic) NSArray *events;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle* bundle = [NSBundle mainBundle];
    NSString* plistPath = [bundle pathForResource:@"events" ofType:@"plist"];
    //获取属性列表文件中的全部数据
    self.events = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    COL_NUM = 2;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    int num = [self.events count] % COL_NUM;
    if(num == 0) {
        return [self.events count] / COL_NUM;
    } else {
        return [self.events count] / COL_NUM + 1;
    }
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return COL_NUM;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    EventCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    NSDictionary* event = self.events[indexPath.section * COL_NUM + indexPath.row];
    cell.label.text = [event objectForKey:@"name"];
    cell.imageView.image = [UIImage imageNamed:event[@"image"]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary* event = self.events[indexPath.section * COL_NUM + indexPath.row];
    NSLog(@"SELECT event name: %@", event[@"name"]);
}


@end
