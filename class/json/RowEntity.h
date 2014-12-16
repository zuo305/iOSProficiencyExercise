//
//  
//  RowEntity
//
//  Created by John
//  Copyright (c) 2012 John. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface RowEntity : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *contentdesc;
@property (nonatomic,copy) NSString *imageHref;



-(id)initWithJson:(NSDictionary *)json;

@end
