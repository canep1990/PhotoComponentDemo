//
//  YVSectionInfo.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YVSectionView.h"

/** Custom object for holding Section Info */
@interface YVSectionInfo : NSObject

/** Section title */
@property (copy, nonatomic) NSString *sectionInfoTitle;
/** Array of image urls */
@property (copy, nonatomic) NSArray *imagesURLArray;

/** Flag. Indicates if the section is open */
@property (getter = isOpen) BOOL open;
/** Header view */
@property YVSectionView *headerView;

@end
