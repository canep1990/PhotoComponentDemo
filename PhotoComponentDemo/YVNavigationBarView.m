//
//  YVNavigationBarView.m
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 31.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVNavigationBarView.h"
#import "UIColor+ApplicationColor.h"

@implementation YVNavigationBarView

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor yv_darkApplicationColor];
}

@end
