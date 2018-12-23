//
//  EventCollectionViewCell.h
//  CollectionView
//
//  Created by MyZiyue on 2018/12/14.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EventCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

NS_ASSUME_NONNULL_END
