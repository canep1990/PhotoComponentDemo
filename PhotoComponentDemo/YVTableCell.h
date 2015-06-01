//
//  YVTableCell.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//


#import <UIKit/UIKit.h>

@class YVTableCell;

@protocol YVTableCellDelegate <NSObject>

- (void)tableCell:(YVTableCell *)imageCell didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

FOUNDATION_EXPORT NSInteger const YVItemLayoutSize;
FOUNDATION_EXPORT NSInteger const YVItemSpacing;

@interface YVTableCell : UITableViewCell

@property (weak, nonatomic) id <YVTableCellDelegate> delegate;

@property (strong, nonatomic) NSArray *imagesURLArray;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
