//
//  YVIndexPath.m
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 31.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVIndexPath.h"

@implementation YVIndexPath

- (BOOL)isEqual:(id)object
{
    NSLog(@"isEqual");
    YVIndexPath *indexPathToCompare = (YVIndexPath *)object;
    BOOL isEqual = NO;
    if ([self.selectedCollectionViewIndexPath isEqual:indexPathToCompare.selectedCollectionViewIndexPath] && [self.selectedTableViewIndexPath isEqual:indexPathToCompare.selectedTableViewIndexPath])
    {
        isEqual = YES;
        NSLog(@"is equal");
    }
    else
    {
        NSLog(@"not equal");
    }
    return isEqual;
}

@end
