//
//  
//  RowEntity
//
//  Created by John
//  Copyright (c) 2012 John. All rights reserved.
//
#import "rowEntity.h"

@implementation rowEntity


-(id)initWithJson:(NSDictionary *)json;
{
    self = [super init];
    if(self)
    {
        if(json != nil)
        {
            self._title  = [json objectForKey:@"title"];
            self._description  = [json objectForKey:@"description"];
            self._imageHref  = [json objectForKey:@"imageHref"];
            
        }
    }
    return self;
}





@end
