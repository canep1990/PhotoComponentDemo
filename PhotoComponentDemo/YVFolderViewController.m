//
//  YVFolderViewController.m
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVFolderViewController.h"
#import "YVFolderView.h"
#import "YVSectionInfo.h"
#import "YVTableCell.h"
#import "YVSectionInfo.h"
#import "YVNavigationBarView.h"

static NSString *const kCellReuseIndentifier = @"Cell333";
static NSString *const kSectionHeaderViewIdentifier = @"SectionHeaderViewIdentifier";
static NSString *const kURLStringForKittens = @"http://placekitten.com/g/134/134";

@interface YVFolderViewController () <YVFolderViewDelegate>

@end

@implementation YVFolderViewController

- (void)loadView
{
    YVFolderView *view = [[YVFolderView alloc] init];
    view.delegate = self;
    NSArray *sectionInfoArray = [self initializeArrayOfObjects];
    view.sectionInfoArray = sectionInfoArray;
    [view reloadData];
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.titleView = [[YVNavigationBarView alloc] init];
}

- (NSArray *)initializeArrayOfObjects
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 50; i++)
    {
        YVSectionInfo *sectionInfo = [[YVSectionInfo alloc] init];
        sectionInfo.sectionInfoTitle = [NSString stringWithFormat:@"Album %d", i];
        if (i==0)
        {
            sectionInfo.open = YES;
        }
        else
        {
            sectionInfo.open = NO;
        }
        NSMutableArray *imagesURLArray = [NSMutableArray array];
        
        for (int j = 0; j < [self randomNumberBetween:3 maxNumber:50]; j++)
        {
            [imagesURLArray addObject:[NSURL URLWithString:kURLStringForKittens]];
        }
        sectionInfo.imagesURLArray = imagesURLArray;
        [array addObject:sectionInfo];
    }
    return array;
}

- (NSInteger)randomNumberBetween:(NSInteger)min maxNumber:(NSInteger)max
{
    NSLog(@"random number is: %d", min + arc4random_uniform(max - min + 1));
    return min + arc4random_uniform(max - min + 1);
}

#pragma mark - YVFolderViewDelegate

- (void)numberOfSelectedObjectsDidChange:(NSUInteger)numberOfObjects
{
    YVNavigationBarView *navigationBarView = (YVNavigationBarView *)self.navigationItem.titleView;
    if (numberOfObjects == 0) {
        navigationBarView.selectionDescriptionLabel.text = @"";
    } else {
        navigationBarView.selectionDescriptionLabel.text = [NSString stringWithFormat:@"%d из %d", numberOfObjects, YVMaximumArrayCapacity];
    }
}

@end
