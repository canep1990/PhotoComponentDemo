//
//  YVSectionView.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 29.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YVSectionView;

/*
 Protocol to be adopted by the section header's delegate; the section header tells its delegate when the section should be opened and closed.
 */
@protocol YVSectionViewDelegate <NSObject>

- (void)sectionHeaderView:(YVSectionView *)sectionHeaderView didToggleSection:(NSInteger)section;

@end

@interface YVSectionView : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *disclosureButton;
@property (weak, nonatomic) id <YVSectionViewDelegate> delegate;

@property (unsafe_unretained, nonatomic) NSInteger section;

- (void)toggleOpenSectionView;

@end
