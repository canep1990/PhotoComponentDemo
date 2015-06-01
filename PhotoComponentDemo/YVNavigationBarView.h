//
//  YVNavigationBarView.h
//  PhotoComponentDemo
//
//  Created by Юрий Воскресенский on 31.05.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVBaseView.h"

/** Custom view for navigation ber */
@interface YVNavigationBarView : YVBaseView

/** Nav bar title label */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/** Nav bar description label */
@property (weak, nonatomic) IBOutlet UILabel *selectionDescriptionLabel;

@end
