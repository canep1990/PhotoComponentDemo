//
//  YVTableCell.m
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVTableCell.h"
#import "YVImageCollectionCell.h"
#import "UIColor+ApplicationColor.h"
#import "AsyncImageView.h"
#import "APLReachability.h"

/** Collection cell reuse identifier */
static NSString *const kCollectionCellReuseIndentifier = @"CollectionCell";
NSInteger const YVItemLayoutSize = 67;
NSInteger const YVItemSpacing = 10;

@interface YVTableCell () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation YVTableCell

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initHelper];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self initHelper];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initHelper];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initHelper];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self.collectionView registerNib:[UINib nibWithNibName:@"YVImageCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:kCollectionCellReuseIndentifier];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(YVItemLayoutSize, YVItemLayoutSize);
    flowLayout.minimumInteritemSpacing = YVItemSpacing;
    flowLayout.sectionInset = UIEdgeInsetsMake(YVItemSpacing, YVItemSpacing, YVItemSpacing, YVItemSpacing);
    flowLayout.minimumLineSpacing = YVItemSpacing;
    self.collectionView.collectionViewLayout = flowLayout;
    self.collectionView.backgroundColor = [UIColor yv_lightGrayApplicationColor];
}

- (void)initHelper
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imagesURLArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YVImageCollectionCell *cell = (YVImageCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCollectionCellReuseIndentifier forIndexPath:indexPath];
    NSURL *urlForLoading = self.imagesURLArray[indexPath.row];
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cell];
    APLReachability *reachability = [APLReachability reachabilityWithHostName:[urlForLoading host]];
    if (self.selectedIndexesArray)
    {
        if ([self.selectedIndexesArray containsObject:indexPath])
        {
            [cell.overlayView setHidden:NO];
        }
        else
        {
            [cell.overlayView setHidden:YES];
        }
    }
    else
    {
        [cell.overlayView setHidden:YES];
    }
    if ([reachability currentReachabilityStatus] == NotReachable)
    {
        cell.imageView.image = [UIImage imageNamed:@"kitten.jpg"];
    }
    else
    {
        cell.imageView.imageURL = self.imagesURLArray[indexPath.row];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableCell:didSelectRowAtIndexPath:)])
    {
        [self.delegate tableCell:self  didSelectRowAtIndexPath:indexPath];
    }
}

@end
