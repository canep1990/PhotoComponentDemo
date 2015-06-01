//
//  YVSectionView.m
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVSectionView.h"
#import "UIColor+ApplicationColor.h"
#import "UIView+Borders.h"

static NSInteger const kDegreesRotationAngle = 180;
static float const kAnimationDuration = 0.3;

@implementation YVSectionView

- (void)awakeFromNib
{
    NSLog(@"Awake from nib YVSectionView: %d", self.section);
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleOpen:)];
    [self.contentView addGestureRecognizer:tapGesture];
    self.contentView.backgroundColor = [UIColor yv_grayApplicationColor];
    [self.contentView addBottomBorderWithHeight:1 andColor:[UIColor yv_lightGrayApplicationColor]];
}

- (IBAction)toggleOpen:(id)sender
{
    [self toggleOpenSectionView];
}

- (void)toggleOpenSectionView
{    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        CGAffineTransform rotateTransform = CGAffineTransformRotate(self.disclosureButton.transform, kDegreesRotationAngle*M_PI/kDegreesRotationAngle);
        self.disclosureButton.transform = rotateTransform;
    }];
    
    if ([self.delegate respondsToSelector:@selector(sectionHeaderView:didToggleSection:)])
    {
        [self.delegate sectionHeaderView:self didToggleSection:self.section];
    }
}

@end
