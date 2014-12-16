//
//  
//  RowEntity
//
//  Created by John
//  Copyright (c) 2012 John. All rights reserved.
//
#import "RowEntity.h"

@implementation RowEntity


-(id)initWithJson:(NSDictionary *)json;
{
    self = [super init];
    if(self)
    {
        if(json != nil)
        {
            _title  =  [json objectForKey:@"title"];
            _contentdesc  = [json objectForKey:@"description"];
            _imageHref  = [json objectForKey:@"imageHref"];
            
        }
    }
    return self;
}



@end
