//
//  YVImageCollectionCell.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Subclass of UICollectionViewCell that displays images */
@interface YVImageCollectionCell : UICollectionViewCell

/** Image view for displaying loaded images */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/** Selection image view */
@property (weak, nonatomic) IBOutlet UIImageView *overlayView;

@end
