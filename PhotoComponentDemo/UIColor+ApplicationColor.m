//
//  UIColor+ApplicationColor.m
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 30.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "UIColor+ApplicationColor.h"

@implementation UIColor (ApplicationColor)

+ (UIColor *)yv_darkApplicationColor
{
    return [UIColor colorWithRed:0.137 green:0.137 blue:0.137 alpha:1.0];
}

+ (UIColor *)yv_grayApplicationColor
{
    return [UIColor colorWithRed:0.819 green:0.819 blue:0.819 alpha:1.0];
}

+ (UIColor *)yv_lightGrayApplicationColor
{
    return [UIColor colorWithRed:0.941 green:0.941 blue:0.941 alpha:1.0];
}

+ (UIColor *)yv_middleGrayApplicationColor
{
    return [UIColor colorWithRed:0.533 green:0.533 blue:0.533 alpha:1.0];
}

@end
