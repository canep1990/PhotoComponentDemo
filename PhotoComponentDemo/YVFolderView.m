//
//  YVFolderView.m
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVFolderView.h"
#import "YVTableCell.h"
#import "YVSectionInfo.h"
#import "YVSectionView.h"
#import "YVIndexPath.h"
#import "YVImageCollectionCell.h"

static NSString *const kCellReuseIndentifier = @"Cell333";
static NSString *const kSectionHeaderViewIdentifier = @"SectionHeaderViewIdentifier";
static NSInteger const kSectionHeaderHeight = 44;
NSUInteger const YVMaximumArrayCapacity = 20;

@interface YVFolderView () <UITableViewDataSource, UITableViewDelegate, YVSectionViewDelegate, YVTableCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *selectedIndexPathsArray;
@property (nonatomic) NSInteger openSectionIndex;

@end

@implementation YVFolderView

- (void)awakeFromNib
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor clearColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"YVTableCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kCellReuseIndentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"YVSectionView" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kSectionHeaderViewIdentifier];
    self.tableView.tableFooterView = view;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.sectionHeaderHeight = kSectionHeaderHeight;
    self.openSectionIndex = NSNotFound;
    self.selectedIndexPathsArray = [[NSMutableArray alloc] initWithCapacity:YVMaximumArrayCapacity];
}

- (void)reloadData
{
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.sectionInfoArray && self.sectionInfoArray.count > 0) return self.sectionInfoArray.count;
    else return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    YVSectionInfo *sectionInfo = (self.sectionInfoArray)[section];
    return sectionInfo.open ? 1 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YVTableCell *cell = (YVTableCell *)[tableView dequeueReusableCellWithIdentifier:kCellReuseIndentifier];
    if (!cell)
    {
        cell = [[YVTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellReuseIndentifier];
    }
    cell.delegate = self;
    YVSectionInfo *sectionInfo = (self.sectionInfoArray)[indexPath.section];
    cell.imagesURLArray = sectionInfo.imagesURLArray;
    [cell.collectionView reloadData];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSLog(@"loading viewForHeaderInSection");
    YVSectionView *sectionHeaderView = [tableView dequeueReusableCellWithIdentifier:kSectionHeaderViewIdentifier];
    
    YVSectionInfo *sectionInfo = (self.sectionInfoArray)[section];
    sectionInfo.headerView = sectionHeaderView;
    NSLog(@"YVSectionInfo viewForHeaderInSection: %@", sectionInfo.sectionInfoTitle);
    
    if (sectionInfo.open)
    {
        CGAffineTransform rotateTransform = CGAffineTransformRotate(sectionHeaderView.disclosureButton.transform, 180*M_PI/180.0);
        sectionHeaderView.disclosureButton.transform = rotateTransform;
    }
    
    sectionHeaderView.titleLabel.text = sectionInfo.sectionInfoTitle;
    sectionHeaderView.section = section;
    sectionHeaderView.delegate = self;
    
    return sectionHeaderView.contentView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YVSectionInfo *sectionInfo = self.sectionInfoArray[indexPath.section];
    NSUInteger numberOfElements = sectionInfo.imagesURLArray.count / 4;
    NSUInteger reminderOfDevision = fmod(sectionInfo.imagesURLArray.count, 4);
    NSLog(@"numberOfElements: %d for section: %d numberOfElements: %d, reminderOfDevision: %d", sectionInfo.imagesURLArray.count, indexPath.section, numberOfElements, reminderOfDevision);
    if (reminderOfDevision != 0)
        numberOfElements = numberOfElements + 1;
    CGFloat heightForAllElements = YVItemLayoutSize * numberOfElements + YVItemSpacing * (numberOfElements + 1);

    CGFloat heightForScreen;
    if (indexPath.section == 0)
        heightForScreen = self.frame.size.height - ((kSectionHeaderHeight*2));
    else
        heightForScreen = self.frame.size.height - ((kSectionHeaderHeight*3));
    
    NSLog(@"heightForAllElements: %f heightForScreen: %f", heightForAllElements, heightForScreen);

    if (heightForAllElements >= heightForScreen)
        return heightForScreen;
    else
        return heightForAllElements;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kSectionHeaderHeight;
}

#pragma mark - YVSectionHeaderViewDelegate

- (void)sectionHeaderView:(YVSectionView *)sectionHeaderView didToggleSection:(NSInteger)section
{
    YVSectionInfo *sectionInfo = (self.sectionInfoArray)[section];
    BOOL isOpened = sectionInfo.open;
    if (isOpened)
    {
        // if the section was opened before - just delete the row
        sectionInfo.open = NO;
        NSInteger countOfRowsToDelete = 1;
        
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++)
        {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:section]];
        }
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
        [self.tableView endUpdates];
    }
    else
    {
        // if the section was closed before - just add the row
        sectionInfo.open = YES;
        
        NSInteger countOfRowsToInsert = 1;
        NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToInsert; i++)
        {
            [indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:section]];
        }
        
        // style the animation for the smooth flow
        UITableViewRowAnimation insertAnimation;
        insertAnimation = UITableViewRowAnimationMiddle;
        
        // apply the updates
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:insertAnimation];
        [self.tableView endUpdates];
        // scroll to needed scroll position
        CGRect rectToInsert = [self.tableView rectForRowAtIndexPath:indexPathsToInsert[0]];
        CGFloat y = rectToInsert.origin.y + kSectionHeaderHeight;
        rectToInsert.origin.y = y;
        [self.tableView scrollRectToVisible:rectToInsert animated:YES];
    }
}

#pragma mark - table cell delegate

- (void)tableCell:(YVTableCell *)imageCell didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YVIndexPath *selectedIndexPath = [[YVIndexPath alloc] init];
    NSIndexPath *tableSelectedIndexPath = [self.tableView indexPathForCell:imageCell];
    selectedIndexPath.selectedTableViewIndexPath = tableSelectedIndexPath;
    selectedIndexPath.selectedCollectionViewIndexPath = indexPath;
    YVImageCollectionCell *collectionCell = (YVImageCollectionCell *)[imageCell.collectionView cellForItemAtIndexPath:indexPath];
    if (collectionCell.imageView.image)
    {
        if ([self.selectedIndexPathsArray containsObject:selectedIndexPath])
        {
            [self.selectedIndexPathsArray removeObject:selectedIndexPath];
            [collectionCell.overlayView setHidden:YES];
        }
        else
        {
            [self.selectedIndexPathsArray addObject:selectedIndexPath];
            [collectionCell.overlayView setHidden:NO];
        }
        if (self.delegate && [self.delegate respondsToSelector:@selector(numberOfSelectedObjectsDidChange:)])
        {
            [self.delegate numberOfSelectedObjectsDidChange:self.selectedIndexPathsArray.count];
        }
    }
}

@end
