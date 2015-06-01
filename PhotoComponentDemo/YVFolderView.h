//
//  YVFolderView.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVBaseView.h"

/** Protocol to be adopted by the vc. Indicates the number of objects selected */
@protocol YVFolderViewDelegate <NSObject>

/** Show how many objects were selected */
- (void)numberOfSelectedObjectsDidChange:(NSUInteger)numberOfObjects;
/** Indicates that number of selected objects did exceed the limit */
- (void)numberOfSelectedObjectsDidExceedTheLimit;

@end

/** Contant for number of selected objects */
FOUNDATION_EXPORT NSUInteger const YVMaximumArrayCapacity;

/** Custom folder view */
@interface YVFolderView : YVBaseView

/** NSArray of section info objects */
@property (copy, nonatomic) NSArray *sectionInfoArray;
/** Delegate property */
@property (weak, nonatomic) id <YVFolderViewDelegate> delegate;
/** Helper for reloading data */
- (void)reloadData;

@end
