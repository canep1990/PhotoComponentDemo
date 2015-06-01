//
//  YVIndexPath.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 31.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YVIndexPath : NSObject

@property (strong, nonatomic) NSIndexPath *selectedTableViewIndexPath;
@property (strong, nonatomic) NSIndexPath *selectedCollectionViewIndexPath;

@end
