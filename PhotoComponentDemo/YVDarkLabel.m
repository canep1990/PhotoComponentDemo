//
//  YVDarkLabel.m
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 30.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVDarkLabel.h"
#import "UIColor+ApplicationColor.h"

@implementation YVDarkLabel

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
    self.textColor = [UIColor yv_darkApplicationColor];
}


@end
