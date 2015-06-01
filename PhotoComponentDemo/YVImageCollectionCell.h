//
//  YVImageCollectionCell.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YVImageCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/** Selection image view */
@property (weak, nonatomic) IBOutlet UIImageView *overlayView;
/** Flag that indicates if the cell can be selected. If Image for that cell was downloaded, isSelectable = YES */
@property (nonatomic) BOOL isSelectable;


@end
