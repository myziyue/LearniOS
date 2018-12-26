//
//  ViewController.m
//  CollectionView1
//
//  Created by MyZiyue on 2018/12/18.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"
#import "EventCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
{
    int COL_NUM; // 每一行有几个单元格
}
@property (strong, nonatomic) NSArray* events;
@property (strong, nonatomic) UICollectionView* collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle* bundle = [NSBundle mainBundle];
    NSString* plistPath = [bundle pathForResource:@"events" ofType:@"plist"];
    
    self.events = [[NSArray alloc] initWithContentsOfFile: plistPath];
    
    COL_NUM = 2;
    
    [self setupCollectionView];
}

-(void)setupCollectionView {
    // 1.创建流式布局
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    // 2.设置每个单元格的尺寸
    layout.itemSize = CGSizeMake(150, 150);
    // 3.设置整个collectionView的内边距
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    // 4.设置每一行之间的间距
    layout.minimumLineSpacing = 10;
    // 5.设置单元格之间的间距
    layout.minimumInteritemSpacing = 10;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    // 设置可重用单元格标识与单元格类型
    [self.collectionView registerClass:[EventCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
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
