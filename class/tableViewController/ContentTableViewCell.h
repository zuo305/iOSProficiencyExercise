//
//  ContentTableViewCell.h
//  iOSProficiencyExercise
//
//  Created by 左村 on 14/12/16.
//  Copyright (c) 2014年 左村. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RowEntity;

@interface ContentTableViewCell : UITableViewCell
{
    @private
    UILabel *titleLabel_;
    UILabel *contentdescLabel_;
    UIImageView *iconImageView_;
}


-(void)setRowEntity:(RowEntity*)rowEntity;
+(float)CellHeightByRowEntity:(RowEntity*)rowEntity;
+(float)calculateHeightByText:(NSString*)text width:(float)width minHeight:(float)minHeight fontSize:(float)fontSize;

@end
