//
//  YVTableCell.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//


#import <UIKit/UIKit.h>

@class YVTableCell;

/** Delegate. Indicates that an item was selected in image cell */
@protocol YVTableCellDelegate <NSObject>

/** Callback for selected item */
- (void)tableCell:(YVTableCell *)imageCell didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

/** Constant for layout item size */
FOUNDATION_EXPORT NSInteger const YVItemLayoutSize;
/** Constant for padding */
FOUNDATION_EXPORT NSInteger const YVItemSpacing;

/** Custom cell that displays loaded images in grids */
@interface YVTableCell : UITableViewCell

/** Delegate property */
@property (weak, nonatomic) id <YVTableCellDelegate> delegate;

/** NSArray of images to download */
@property (copy, nonatomic) NSArray *imagesURLArray;

/** Collection View */
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
