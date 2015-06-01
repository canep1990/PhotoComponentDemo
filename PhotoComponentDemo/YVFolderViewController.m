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

/** Const for kittens url */
static NSString *const kURLStringForKittens = @"http://placekitten.com/g/134/134";
/** Const for alert title */
static NSString *const kAlertTitle = @"Ошибка";
/** Const for alert message */
static NSString *const kAlertMessage = @"Превышен лимит выбора котиков";
/** Const for alert button title */
static NSString *const kButtonTitle = @"OK";

@interface YVFolderViewController () <YVFolderViewDelegate>

/** Create albums data */
- (NSArray *)initializeArrayOfObjects;

/** Generate random number within a range */
- (NSInteger)randomNumberBetween:(NSInteger)min maxNumber:(NSInteger)max;

@end

@implementation YVFolderViewController

- (void)loadView
{
    // load folder view
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
    // create custom nav item from xib
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

- (void)numberOfSelectedObjectsDidExceedTheLimit
{
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
    {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:kAlertTitle message:kAlertMessage preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:kButtonTitle style:UIAlertActionStyleCancel handler:nil];
        [controller addAction:action];
        [self presentViewController:controller animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kAlertTitle message:kAlertMessage delegate:nil cancelButtonTitle:kButtonTitle otherButtonTitles:nil];
        [alert show];
    }
}

@end
