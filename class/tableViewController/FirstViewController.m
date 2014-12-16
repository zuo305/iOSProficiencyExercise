//
//  firstViewController.m
//  iOSProficiencyExercise
//
//  Created by John on 14/12/16.
//  Copyright (c) 2014year John. All rights reserved.
//

#import "FirstViewController.h"
#import "AFNetworking.h"
#import "DataJsonObject.h"
#import "ContentTableViewCell.h"


#define kDataURL @"https://dl.dropboxusercontent.com/u/746330/facts.json"
#define kSystemLineHeight 20   //系统时间条高度
#define kNavLineHeight 44          //系统导航默认高度
#define kAutoPullHeight 66.0
#define kDelayPullTimer 0.1

#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)


@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(IS_OS_7_OR_LATER)
        self.automaticallyAdjustsScrollViewInsets=NO;

    [self initTabelView];
}

- (void)initTabelView
{
    infoTableView_=[[UITableView alloc] initWithFrame:CGRectMake(0, kSystemLineHeight+kNavLineHeight, self.view.bounds.size.width, self.view.bounds.size.height-kSystemLineHeight-kNavLineHeight)];
    infoTableView_.delegate=self;
    infoTableView_.dataSource=self;
    [self.view addSubview:infoTableView_];
    [infoTableView_ registerClass:[ContentTableViewCell class] forCellReuseIdentifier:@"ContentTableViewCell"];
    
    
    if (refreshHeaderView_ == nil) {
        
        EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - infoTableView_.bounds.size.height, self.view.frame.size.width, infoTableView_.bounds.size.height)];
        view.delegate = self;
        [infoTableView_ addSubview:view];
        refreshHeaderView_ = view;
    }
    
    //  update the last update date
    [refreshHeaderView_ refreshLastUpdatedDate];
    [self performSelector:@selector(autoPullRefresh) withObject:nil afterDelay:kDelayPullTimer];
}

-(void)autoPullRefresh {
    infoTableView_.contentInset = UIEdgeInsetsMake(kAutoPullHeight, 0.0, 0.0, 0.0);
    [refreshHeaderView_ egoRefreshScrollViewDidEndDragging: infoTableView_];
}

- (void)reLoadData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/plain"];
    [manager GET:kDataURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        DataJsonObject *resultObject=[[DataJsonObject alloc] initWithJson:(NSDictionary*)responseObject];
        
        self.title=resultObject.title;

        if(dataArray_==nil)
        {
            dataArray_=[[NSMutableArray alloc] init];
        }
        else
        {
            [dataArray_ removeAllObjects];
        }
//        for(RowEntity *rowEntity in resultObject.rowsArray)
//        {
//            RowEntity *addRowEntity=[[[RowEntity alloc] init] autorelease];
//            addRowEntity.title=[NSString stringWithFormat:@"%@",rowEntity.title];
//            addRowEntity.contentdesc=[NSString stringWithFormat:@"%@",rowEntity.contentdesc];
//            addRowEntity.imageHref=[NSString stringWithFormat:@"%@",rowEntity.imageHref];
//            [dataArray_ addObject:addRowEntity];
//        }
        
        dataArray_=resultObject.rowsArray;
        
        
        [infoTableView_ reloadData];
        
        [self doneLoadingTableViewData];
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [dataArray_ count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RowEntity *rowEntity=[dataArray_ objectAtIndex:indexPath.row];
    return [ContentTableViewCell CellHeightByRowEntity:rowEntity];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContentTableViewCell" forIndexPath:indexPath];
    
    RowEntity *rowEntity=[dataArray_ objectAtIndex:indexPath.row];
    [cell setRowEntity:rowEntity];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
    
    //  should be calling your tableviews data source model to reload
    //  put here just for demo
    reloading_ = YES;
    
}

- (void)doneLoadingTableViewData{
    
    //  model should call this when its done loading
    reloading_ = NO;
    [refreshHeaderView_ egoRefreshScrollViewDataSourceDidFinishedLoading:infoTableView_];
    
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [refreshHeaderView_ egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [refreshHeaderView_ egoRefreshScrollViewDidEndDragging:scrollView];
    
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
    [self reLoadData];
    
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    
    return reloading_; // should return if data source model is reloading
    
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
    
    return [NSDate date]; // should return date data source was last changed
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
