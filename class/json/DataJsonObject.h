//
//  
//  DataJsonObject
//
//  Created by John
//  Copyright (c) 2012 John. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "RowEntity.h"

@interface DataJsonObject : NSObject


@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSMutableArray *rowsArray;
 


-(id)initWithJson:(NSDictionary *)json;

@end
