//
//  UIColor+ApplicationColor.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 30.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Extension. Provides application colors */
@interface UIColor (ApplicationColor)

/** Dark color for Navigation Bar */
+ (UIColor *)yv_darkApplicationColor;
/** Custom gray color */
+ (UIColor *)yv_grayApplicationColor;
/** Custom light gray color */
+ (UIColor *)yv_lightGrayApplicationColor;
/** Custom middle gray color */
+ (UIColor *)yv_middleGrayApplicationColor;

@end
