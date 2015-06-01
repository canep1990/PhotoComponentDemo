//
//  UIImage+ImageWithColor.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 30.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageWithColor)

/** Helper function for getting UIImage from UIColor */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
