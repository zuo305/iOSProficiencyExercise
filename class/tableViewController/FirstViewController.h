//
//  FirstViewController.h
//  iOSProficiencyExercise
//
//  Created by John on 14/12/16.
//  Copyright (c) 2014 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@interface FirstViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,EGORefreshTableHeaderDelegate>
{
@private
    UITableView *infoTableView_;
    NSMutableArray *dataArray_;
    EGORefreshTableHeaderView *refreshHeaderView_;
    BOOL reloading_;
}



@end
