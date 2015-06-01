//
//  YVImageCollectionCell.m
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVImageCollectionCell.h"
#import "UIColor+ApplicationColor.h"

@implementation YVImageCollectionCell

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor yv_middleGrayApplicationColor];
    [self.overlayView setHidden:YES];
}

@end
