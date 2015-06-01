//
//  YVFolderView.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVBaseView.h"

@protocol YVFolderViewDelegate <NSObject>

- (void)numberOfSelectedObjectsDidChange:(NSUInteger)numberOfObjects;

@end

FOUNDATION_EXPORT NSUInteger const YVMaximumArrayCapacity;

@interface YVFolderView : YVBaseView

@property (strong, nonatomic) NSArray *sectionInfoArray;
@property (weak, nonatomic) id <YVFolderViewDelegate> delegate;

- (void)reloadData;

@end
