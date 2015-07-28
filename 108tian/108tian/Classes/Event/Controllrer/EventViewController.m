//
//  EventViewController.m
//  108tian
//
//  Created by SUN on 15-7-12.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "EventViewController.h"
#import "DownLoadManager.h"
#import "TotalModel.h"
#import "TotalTableViewCell.h"
#import "MJRefresh.h"
#import "SegmentView.h"
#import "EventTravelViewController.h"


// 全部
#define Totle_URL @"https://api.108tian.com/mobile/v2/EventList?cityId=1&step=10&theme=0&page=%d"
// 旅游运动
#define Travel_URL @"https://api.108tian.com/mobile/v2/EventList?cityId=1&step=10&theme=1&page=%d"
// 体育运动
#define Sport_URL @"https://api.108tian.com/mobile/v2/EventList?cityId=1&step=10&theme=2&page=%d"
// 生活聚会
#define Life_URL @"https://api.108tian.com/mobile/v2/EventList?cityId=1&step=10&theme=3&page=%d"
// 免费体检
#define Free_URL @"https://api.108tian.com/mobile/v2/EventList?cityId=1&step=10&theme=4&page=%d"

// 测试URL
#define Event_URL @"https://api.108tian.com/mobile/v2/EventList?cityId=1&step=10&theme=%d&page=%d"

#define Event_Travel_Detail_URL @"https://api.108tian.com/mobile/v2/EventDetail?id=%@&uuid=f5471feaca28dc58721eebb3bb0ffb0b75ae1546&timeStamp=1436965168235"

//#define Event_Total_Detail_URL @"https://api.108tian.com/mobile/v2/EventDetail?id=%@&uuid=f5471feaca28dc58721eebb3bb0ffb0b75ae1546&timeStamp=1436965040613"

@interface EventViewController ()

@end

@implementation EventViewController
{
    UITableView *_totalTableView;
    UIScrollView *_scrollView;
    DownLoadManager *_downLoadManger;
    NSMutableArray *_totleDataArray;
    NSInteger _totalPage;
    SegmentView *_segmentView;
    UIView *_view;
    BOOL _isTotalFooterDownFlag;
    BOOL _isTotalHeaderDownFlag;
    
    UITableView *_travelTableView;
    NSMutableArray *_travelDataArray;
    NSInteger _travelPage;
    
    UITableView *_sportTableView;
    NSMutableArray *_sportDataArray;
    NSInteger _sportPage;
    
    UITableView *_lifeTableView;
    NSMutableArray *_lifeDataArray;
    NSInteger _lifePage;
    
    UITableView *_freeTableView;
    NSMutableArray *_freeDataArray;
    NSInteger _freePage;
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _totalPage = 0;
    _travelPage = 0;
    _sportPage = 0;
    _lifePage = 0;
    _freePage = 0;
    _isTotalFooterDownFlag = NO;
    _isTotalHeaderDownFlag = NO;
    // 导航
    [self loadNavigationBar];
    
    // 分段按钮
    _segmentView = [SegmentView viewWithTarget:self andAction:@selector(segmentBtnClick:)];
    [self.view addSubview:_segmentView];
    
    _view = [[UIView alloc] init];
    _view.frame = CGRectMake(0, 41, 320 / 5, 3);
    _view.backgroundColor = [UIColor colorWithRed:0.34f green:0.78f blue:0.71f alpha:1.00f];
    [_segmentView addSubview:_view];
    
    // scrollView
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake( 0 , 20 + 44 + 44, 320 , 480 - 20 - 44 - 44);
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.contentSize = CGSizeMake(320 * 5, 480 - 20 - 44 - 44);
    [self.view addSubview:_scrollView];
    
    // 全部界面
    _totalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480 - 20 - 44 - 44) style:UITableViewStylePlain];
    _totalTableView.delegate = self;
    _totalTableView.dataSource = self;
    [_scrollView addSubview:_totalTableView];
    // 49像素
    _totalTableView.tableFooterView = [SegmentView createBlankView];
    //下载
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(totalDownLoadFinished) name:Totle_URL object:nil];
    _downLoadManger = [DownLoadManager sharedDownLoadManager];
    [_downLoadManger addDownLoadWithDownLoadStr:Totle_URL andPage:_totalPage andDownLoadType:3 andIsRefresh:NO];
    
    // 触底加载
    _totalTableView.footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(totalFooterRefreshed)];
    // 下拉刷新
    _totalTableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(totalHeaderRefreshed)];
    
    
    
    // 旅游界面
    _travelTableView = [[UITableView alloc] initWithFrame:CGRectMake(320 * 1, 0, 320, 480 - 20 - 44 - 44) style:UITableViewStylePlain];
    _travelTableView.delegate = self;
    _travelTableView.dataSource = self;
    [_scrollView addSubview:_travelTableView];
    // 49像素
    _travelTableView.tableFooterView = [SegmentView createBlankView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(travelDownLoadFinished) name:Travel_URL object:nil];
    [_downLoadManger addDownLoadWithDownLoadStr:Travel_URL andPage:_travelPage andDownLoadType:3 andIsRefresh:NO];
    

    // 体育界面
    _sportTableView = [[UITableView alloc] initWithFrame:CGRectMake(320 * 2, 0, 320, 480 - 20 - 44 - 44) style:UITableViewStylePlain];
    _sportTableView.delegate = self;
    _sportTableView.dataSource = self;
    [_scrollView addSubview:_sportTableView];
    // 49像素
    _sportTableView.tableFooterView = [SegmentView createBlankView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sportDownLoadFinished) name:Sport_URL object:nil];
    [_downLoadManger addDownLoadWithDownLoadStr:Sport_URL andPage:_sportPage andDownLoadType:3 andIsRefresh:NO];
    
    // 生活聚会
    _lifeTableView = [[UITableView alloc] initWithFrame:CGRectMake(320 * 3, 0, 320, 480 - 20 - 44 - 44) style:UITableViewStylePlain];
    _lifeTableView.delegate = self;
    _lifeTableView.dataSource = self;
    [_scrollView addSubview:_lifeTableView];
    // 49像素
    _lifeTableView.tableFooterView = [SegmentView createBlankView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lifeDownLoadFinished) name:Life_URL object:nil];
    [_downLoadManger addDownLoadWithDownLoadStr:Life_URL andPage:_travelPage andDownLoadType:3 andIsRefresh:NO];
    

    // 旅游界面
    _freeTableView = [[UITableView alloc] initWithFrame:CGRectMake(320 * 4, 0, 320, 480 - 20 - 44 - 44) style:UITableViewStylePlain];
    _freeTableView.delegate = self;
    _freeTableView.dataSource = self;
    [_scrollView addSubview:_freeTableView];
    // 49像素
    _freeTableView.tableFooterView = [SegmentView createBlankView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(freeDownLoadFinished) name:Free_URL object:nil];
    [_downLoadManger addDownLoadWithDownLoadStr:Free_URL andPage:_travelPage andDownLoadType:3 andIsRefresh:NO];

    
}

-(void)sportDownLoadFinished
{
    _sportDataArray = [_downLoadManger getDataWithDownLoadStr:Sport_URL];
    [_sportTableView reloadData];
}

-(void)lifeDownLoadFinished
{
    _lifeDataArray = [_downLoadManger getDataWithDownLoadStr:Life_URL];
    [_lifeTableView reloadData];
}

-(void)freeDownLoadFinished
{
    _freeDataArray = [_downLoadManger getDataWithDownLoadStr:Free_URL];
    [_freeTableView reloadData];
}



-(void)totalDownLoadFinished
{
    _totleDataArray = [_downLoadManger getDataWithDownLoadStr:Totle_URL];
    [_totalTableView reloadData];
    _isTotalFooterDownFlag = NO;
    _isTotalHeaderDownFlag = NO;
}


-(void)travelDownLoadFinished
{
    _travelDataArray = [_downLoadManger getDataWithDownLoadStr:Travel_URL];
    [_travelTableView reloadData];
}

-(void)totalFooterRefreshed
{
    
    if (!_isTotalFooterDownFlag)
    {
        NSLog(@"触底加载");
        _isTotalFooterDownFlag = YES;
        _totalPage = _totalPage + 1;
        [_downLoadManger addDownLoadWithDownLoadStr:Totle_URL andPage:_totalPage andDownLoadType:3 andIsRefresh:NO];
    }
    else
    {
        NSLog(@"正在触底加载中---");
    }
    [_totalTableView.footer endRefreshing];
}

-(void)totalHeaderRefreshed
{
    if (!_isTotalHeaderDownFlag)
    {
        _isTotalHeaderDownFlag = YES;
        NSLog(@"下拉刷新");
    
        [_downLoadManger addDownLoadWithDownLoadStr:Totle_URL andPage:0 andDownLoadType:3 andIsRefresh:YES];
    }
    else
    {
        NSLog(@"正在下拉刷新中---");
    }
    [_totalTableView.header endRefreshing];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _totalTableView)
    {
        return _totleDataArray.count;
    }
    else if (tableView == _travelTableView)
    {
        return _travelDataArray.count;
    }
    else if (tableView == _sportTableView)
    {
        return _sportDataArray.count;
    }
    else if (tableView ==  _lifeTableView)
    {
        return _lifeDataArray.count;
    }
    else
        return _freeDataArray.count;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *FLAG = @"ZhongGuo";
    TotalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FLAG];
    if (cell == nil)
    {
        cell = [[TotalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:FLAG];
    }
    if (tableView == _totalTableView)
    {
        cell.totModel = [_totleDataArray objectAtIndex:indexPath.row];
    }
    else if (tableView == _travelTableView)
    {
        cell.totModel = [_travelDataArray objectAtIndex:indexPath.row];
    }
    else if (tableView == _sportTableView)
    {
        cell.totModel = [_sportDataArray objectAtIndex:indexPath.row];
    }
    else if (tableView == _lifeTableView)
    {
        cell.totModel = [_lifeDataArray objectAtIndex:indexPath.row];
    }
    else
    {
        cell.totModel = [_freeDataArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventTravelViewController *etvc = [[EventTravelViewController alloc] init];
    NSArray *tempArray;
    if (tableView == _travelTableView)
    {
        tempArray = _travelDataArray;
    }
    else if (tableView == _sportTableView)
    {
        tempArray = _sportDataArray;
    }
    else if (tableView == _lifeTableView)
    {
        tempArray = _lifeDataArray;
    }
    else if (tableView == _freeTableView)
    {
        tempArray = _freeDataArray;
    }
    else
        tempArray = _totleDataArray;
    
    TotalModel *tm = [tempArray objectAtIndex:indexPath.row];
    NSString *travelUrlStr = [NSString stringWithFormat:Event_Travel_Detail_URL,tm.idd];
    NSLog(@"活动页面 - %@",travelUrlStr);
    etvc.travelUrlStr = travelUrlStr;
    etvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:etvc animated:YES];
    

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 230;

}


-(void)loadNavigationBar
{
    NSMutableDictionary *rightDict = [[NSMutableDictionary alloc] initWithObjects:@[@"active_nav_right_btn"] forKeys:@[@"itembgimagename"]];
    
    [self.myNavigationBar createMyNavigationBarWithBgImageName:@"blue_strip_img" andTitle:self.vcTitle  andLeftItemArray:nil andRightItemArray:@[rightDict] andClass:self andSEL:@selector(navigationBarClick:)];
    
}

-(void)segmentBtnClick:(UIButton *)btn
{
    NSLog(@"点击了分段按钮 - %d",btn.tag);
    
    [_scrollView setContentOffset:CGPointMake(btn.tag * 320, 0) animated:YES];
    _view.frame = CGRectMake(320 / 5 * btn.tag, 41, 320 / 5, 3);
}

-(void)navigationBarClick:(UIButton *)btn
{
    NSLog(@"点击了导航");
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / 320;
    _view.frame = CGRectMake(320 / 5 * index, 41, 320 / 5, 3);
}


-(void)viewWillDisappear:(BOOL)animated
{
    self.myNavigationBar.hidden = YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.myNavigationBar.hidden = NO;
}

@end
