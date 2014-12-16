//
//  
//  RowEntity
//
//  Created by John
//  Copyright (c) 2012 John. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface rowEntity : NSObject

@property (nonatomic,retain) NSString *_title;
@property (nonatomic,retain) NSString *_description;
@property (nonatomic,retain) NSString *_imageHref;



-(id)initWithJson:(NSDictionary *)json;

@end
