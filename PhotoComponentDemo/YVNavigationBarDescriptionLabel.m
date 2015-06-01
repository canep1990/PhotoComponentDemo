//
//  YVNavigationBarDescriptionLabel.m
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 31.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVNavigationBarDescriptionLabel.h"
#import "UIColor+ApplicationColor.h"

@implementation YVNavigationBarDescriptionLabel

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self helperInitializer];
    }
    return self;
}

- (void)helperInitializer
{
    self.textColor = [UIColor yv_grayApplicationColor];
}


@end
