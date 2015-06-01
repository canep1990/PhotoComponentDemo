//
//  YVSectionInfo.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YVSectionView.h"

@interface YVSectionInfo : NSObject

@property (strong, nonatomic) NSString *sectionInfoTitle;
@property (copy, nonatomic) NSArray *imagesURLArray;

@property (getter = isOpen) BOOL open;
@property YVSectionView *headerView;

@end
