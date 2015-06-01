//
//  YVIndexPath.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 31.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Custom object for holding index paths of selected cells */
@interface YVIndexPath : NSObject
/** Index Path for table view */
@property (strong, nonatomic) NSIndexPath *selectedTableViewIndexPath;
/** Index Path for collection view */
@property (strong, nonatomic) NSIndexPath *selectedCollectionViewIndexPath;

@end
