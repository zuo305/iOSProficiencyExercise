//
//  NSString+NSString_Expend.h
//  testcoretext
//
//  Created by Weddingee on 14-2-28.
//  Copyright (c) 2014年 Weddingee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Expend)

-(NSMutableAttributedString *)attributedStringFromStingWithFont:(UIFont *)font
                                                withLineSpacing:(CGFloat)lineSpacing;

-(CGSize)boundingRectWithSize:(CGSize)size
                 withTextFont:(UIFont *)font
              withLineSpacing:(CGFloat)lineSpacing;


@end
