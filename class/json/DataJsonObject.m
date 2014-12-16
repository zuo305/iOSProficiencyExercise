//
//  
//  DataJsonObject
//
//  Created by John
//  Copyright (c) 2012 John. All rights reserved.
//
#import "DataJsonObject.h"


@implementation DataJsonObject


-(id)initWithJson:(NSDictionary *)json;
{
    self = [super init];
    if(self)
    {
        if(json != nil)
        {
            _title  = [json objectForKey:@"title"];
            _rowsArray = [NSMutableArray array];
            for(NSDictionary *item in [json objectForKey:@"rows"])
            {
                [_rowsArray addObject:[[RowEntity alloc] initWithJson:item]];
            }
            
        }
    }
    return self;
}




@end
