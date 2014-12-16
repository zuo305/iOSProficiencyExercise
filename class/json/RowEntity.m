//
//  
//  RowEntity
//
//  Created by John
//  Copyright (c) 2012 John. All rights reserved.
//
#import "RowEntity.h"

#define  kNoData  @"no data"

@implementation RowEntity


-(id)initWithJson:(NSDictionary *)json;
{
    self = [super init];
    if(self)
    {
        if(json != nil)
        {
            
            if ([json objectForKey:@"title"] == [NSNull null]) {
                // it's null
                _title = kNoData;
            }
            else
            {
                _title  =  [json objectForKey:@"title"];
            }
            
            if ([json objectForKey:@"description"] == [NSNull null]) {
                // it's null
                _contentdesc = kNoData;
            }
            else
            {
                _contentdesc  =  [json objectForKey:@"description"];
            }
            
            if ([json objectForKey:@"imageHref"] == [NSNull null]) {
                // it's null
                _imageHref = kNoData;
            }
            else
            {
                _imageHref  =  [json objectForKey:@"imageHref"];
            }
            
        }
    }
    return self;
}



@end
