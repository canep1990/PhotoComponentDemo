//
//  YVSectionView.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YVSectionView;

/** Protocol to be adopted by the section header's delegate; the section header tells its delegate that it was toggled */
@protocol YVSectionViewDelegate <NSObject>

- (void)sectionHeaderView:(YVSectionView *)sectionHeaderView didToggleSection:(NSInteger)section;

@end

/** Custom view for sections header */
@interface YVSectionView : UITableViewCell

/** Title label */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/** Disclosure button */
@property (weak, nonatomic) IBOutlet UIButton *disclosureButton;
/** Delegate */
@property (weak, nonatomic) id <YVSectionViewDelegate> delegate;

/** Current section */
@property (unsafe_unretained, nonatomic) NSInteger section;

/** Selector for toggling the section view */
- (void)toggleOpenSectionView;

@end
