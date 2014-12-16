//
//  ContentTableViewCell.m
//  iOSProficiencyExercise
//
//  Created by 左村 on 14/12/16.
//  Copyright (c) 2014年 左村. All rights reserved.
//

#import "ContentTableViewCell.h"
#import "UIView+Frame.h"
#import "NSString+Expend.h"
#import "RowEntity.h"
#import "SDWebImage/UIImageView+WebCache.h"

#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)

#define kScreenOff  10.0
#define kTitleFontSize 16.0
#define kContentFontSize 12.0
#define kFontSizeOff  5.0
#define kLineSpace 2.0


#define kIconImageWidth 88
#define kIconImageHeight (kIconImageWidth/2.0)

#define kTitleWidth  (kScreenWidth-2*kScreenOff)
#define kContentWidth  (kScreenWidth-5*kScreenOff-kIconImageWidth)

#define kMinCellHeight (kScreenOff+kIconImageHeight+kFontSizeOff)


@implementation ContentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        titleLabel_=[[UILabel alloc] initWithFrame:CGRectMake(kScreenOff, kScreenOff,kTitleWidth,kTitleFontSize+kFontSizeOff)];
        titleLabel_.font=[UIFont boldSystemFontOfSize:kTitleFontSize];
        titleLabel_.textColor=[UIColor blueColor];
        titleLabel_.numberOfLines=0;
        [self addSubview:titleLabel_];
        
        contentdescLabel_=[[UILabel alloc] initWithFrame:CGRectMake(titleLabel_.x, titleLabel_.bottom+kScreenOff,kContentWidth,kContentFontSize+kFontSizeOff)];
        contentdescLabel_.font=[UIFont systemFontOfSize:kContentFontSize];
        contentdescLabel_.textColor= [UIColor blackColor];
        contentdescLabel_.numberOfLines=0;
        
        [self addSubview:contentdescLabel_];
        
        iconImageView_ = [[UIImageView alloc] initWithFrame:CGRectZero];
        iconImageView_.backgroundColor=[UIColor whiteColor];
        iconImageView_.contentMode = UIViewContentModeScaleAspectFill;
        iconImageView_.clipsToBounds=YES;
        [self addSubview:iconImageView_];
        
        
    }
    return self;
}

-(void)setRowEntity:(RowEntity*)rowEntity
{
    NSMutableAttributedString *attrbutedStr= [rowEntity.title attributedStringFromStingWithFont:titleLabel_.font withLineSpacing:kLineSpace];
    float resultHeight=[ContentTableViewCell calculateHeightByText:rowEntity.title width:titleLabel_.width minHeight:kTitleFontSize+kFontSizeOff fontSize:kTitleFontSize];
    CGRect frame = CGRectMake(titleLabel_.x,titleLabel_.y, titleLabel_.width, resultHeight);
    [titleLabel_ setFrame:frame];
    [titleLabel_ setAttributedText:attrbutedStr];

    attrbutedStr= [rowEntity.contentdesc attributedStringFromStingWithFont:contentdescLabel_.font withLineSpacing:kLineSpace];
    resultHeight=[ContentTableViewCell calculateHeightByText:rowEntity.contentdesc width:contentdescLabel_.width minHeight:kContentFontSize+kFontSizeOff fontSize:kContentFontSize];
    frame = CGRectMake(contentdescLabel_.x,contentdescLabel_.y, contentdescLabel_.width, resultHeight);
    [contentdescLabel_ setFrame:frame];
    [contentdescLabel_ setAttributedText:attrbutedStr];

    float imageY=contentdescLabel_.bottom-kIconImageHeight;
    [iconImageView_ setFrame:CGRectMake(kScreenWidth-3*kScreenOff-kIconImageWidth, imageY, kIconImageWidth, kIconImageHeight)];
    if(rowEntity.imageHref.length>0)
    {
        [iconImageView_ sd_setImageWithURL:[NSURL URLWithString:rowEntity.imageHref]];
    }

}

+(float)calculateHeightByText:(NSString*)text width:(float)width minHeight:(float)minHeight fontSize:(float)fontSize
{
    float height=minHeight;
    CGSize size=[text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:fontSize] withLineSpacing:kLineSpace ];
    if(size.height>height)
        height=size.height;
    return height;
}

+(float)CellHeightByRowEntity:(RowEntity*)rowEntity
{
    float titleHeight=[self calculateHeightByText:rowEntity.title width:kTitleWidth minHeight:kTitleFontSize+kFontSizeOff fontSize:kTitleFontSize];
    
    float contentHeight=[ContentTableViewCell calculateHeightByText:rowEntity.contentdesc width:kContentWidth minHeight:kContentFontSize+kFontSizeOff fontSize:kContentFontSize];

    float totalHeight=kScreenOff+titleHeight+kScreenOff+contentHeight+kScreenOff;
    
    if(totalHeight<kMinCellHeight)
        totalHeight=kMinCellHeight;
    return totalHeight;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
