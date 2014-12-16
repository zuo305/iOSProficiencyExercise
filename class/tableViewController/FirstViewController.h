//
//  FirstViewController.h
//  iOSProficiencyExercise
//
//  Created by John on 14/12/16.
//  Copyright (c) 2014 John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
@private
    UITableView *_infoTableView;
    NSArray *_dataArray;
}

@end
