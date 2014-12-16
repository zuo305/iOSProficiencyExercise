//
//  
//  DataJsonObject
//
//  Created by John
//  Copyright (c) 2012 John. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "rowEntity.h"

@interface DataJsonObject : NSObject


@property (nonatomic,retain) NSString *_title;
@property (nonatomic,retain) NSMutableArray *_rowsArray;
 


-(id)initWithJson:(NSDictionary *)json;

@end
