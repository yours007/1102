//
//  HomeViewController.m
//  108tian
//
//  Created by SUN on 15-7-12.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//http://pic.108tian.com/pic/1643b08180f85e004eafcfebe9130103.jpg   1080 229  300 80
//http://www.108tian.com/beijing/dest/scenery_0-15

#import "HomeViewController.h"
#import "MyNavigationBar.h"
#import "TitleButton.h"
#import "DownLoadManager.h"
#import "MyTableViewCell.h"
#import "HomeModel.h"
#import "ItemsModel.h"
#import "SectionHeaderView.h"
#import "ListModel.h"
#import "BannerModel.h"
#import "indexWhatModel.h"
#import "UIImageView+WebCache.h"
#import "FocusView.h"
#import "IndexButton.h"
#import "MJRefresh.h"
#import "HomeTabViewController.h"
#import "HomeContentsViewController.h"
#import "EventTravelViewController.h"
#define HomeList_URL @"https://api.108tian.com/mobile/v2/Home?cityId=1&uuid=8ea4f0cd0ccbbce5a96f322c5a35b8d4ace78b91&timeStamp=1436071238254"

#define Refresh_URL @"https://api.108tian.com/mobile/v2/RecommendDetailList?uuid=8ea4f0cd0ccbbce5a96f322c5a35b8d4ace78b91&cityId=1&step=2&page=%d"

#define Home_TableView_URL @"https://api.108tian.com/mobile/v2/EventDetail?id=%@&uuid=f5471feaca28dc58721eebb3bb0ffb0b75ae1546&timeStamp=1436963297662"

#define HomeClimb_URL @"https://api.108tian.com/mobile/v2/SceneList?page=0&cityId=1&step=10&theme=2&uuid=8ea4f0cd0ccbbce5a96f322c5a35b8d4ace78b91"

#define AncientTown_URL @"https://api.108tian.com/mobile/v2/SceneList?page=0&cityId=1&step=10&theme=29&uuid=f5471feaca28dc58721eebb3bb0ffb0b75ae1546"

#define Cultural_URL @"https://api.108tian.com/mobile/v2/SceneList?page=0&cityId=1&step=10&theme=23&uuid=f5471feaca28dc58721eebb3bb0ffb0b75ae1546"
#define Barbecue_URL @"https://api.108tian.com/mobile/v2/SceneList?page=0&cityId=1&step=10&theme=27&uuid=f5471feaca28dc58721eebb3bb0ffb0b75ae1546"

#define AvoidSummer_URL @"https://api.108tian.com/mobile/v2/SceneList?channel=baidu&cityId=1&page=0&step=20"

#define Trueman_URL @"https://api.108tian.com/mobile/v2/SceneList?channel=baidu&cityId=1&page=0&step=20&theme=16"


@interface HomeViewController ()

@end

@implementation HomeViewController
{
    DownLoadManager *_downLoadManager;
    NSMutableArray *_dataArray;
    UITableView *_tableView;
    NSMutableArray *_homeDataArray;
    FocusView *_focview;
    NSInteger _page;
    BOOL _isHomeFooterDownLoadFlag;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _page = 0;
    _isHomeFooterDownLoadFlag = NO;
    // 导航
    [self loadNavigationBar];
    
    #pragma 第一个下载 tableView内容
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinished) name:Refresh_URL object:nil];
    _downLoadManager = [DownLoadManager sharedDownLoadManager];
    [_downLoadManager addDownLoadWithDownLoadStr:Refresh_URL andPage:_page andDownLoadType:0 andIsRefresh:NO];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, 480 - 64 ) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    // 头视图
    _focview = [[FocusView alloc] init];
    _focview.frame = CGRectMake(0, 0, 320, 270);
    _tableView.tableHeaderView = _focview;
   
    #pragma 第二个下载 - 滚动图 - 人文 古镇 地理
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homeDownLoadfinished) name:HomeList_URL object:nil];
    [_downLoadManager addDownLoadWithDownLoadStr:HomeList_URL andPage:-1 andDownLoadType:1 andIsRefresh:NO];
    // 空44像素
    _tableView.tableFooterView = [SectionHeaderView viewWithNothingCreateBlankView];
    // 触底加载
    _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshed)];
    

}

-(void)refreshed
{
    if (!_isHomeFooterDownLoadFlag)
        {
        _isHomeFooterDownLoadFlag = YES;
        NSLog(@"触底加载");
        _page = _page + 2;
        [_downLoadManager addDownLoadWithDownLoadStr:Refresh_URL andPage:_page andDownLoadType:0 andIsRefresh:NO];
    }
    else
    {
        NSLog(@"正在触底加载---");
    }
    [_tableView.footer endRefreshing];
}


-(void)homeDownLoadfinished
{
    _homeDataArray = [_downLoadManager getDataWithDownLoadStr:HomeList_URL];
    // 循环滚动视图
    [_focview createFocusWithArray:_homeDataArray andClass:self andSEL:@selector(indexBtnClick:)];
}

-(void)downLoadFinished
{
    _dataArray = [_downLoadManager getDataWithDownLoadStr:Refresh_URL];
    [_tableView reloadData];
    _isHomeFooterDownLoadFlag = NO;
}

-(void)loadNavigationBar
{
    NSMutableDictionary *rightDict = [[NSMutableDictionary alloc] initWithObjects:@[@"search_icon"] forKeys:@[@"itembgimagename"]];
    
    [self.myNavigationBar createMyNavigationBarWithBgImageName:@"blue_strip_img" andTitle:self.vcTitle  andLeftItemArray:nil andRightItemArray:@[rightDict] andClass:self andSEL:@selector(navigationBarClick:)];
    
    TitleButton *titleBtn = [TitleButton buttonWithClass:self andSEL:@selector(titleBtnClick)];
    
    [self.myNavigationBar addSubview:titleBtn];
    
}

-(void)titleBtnClick
{
    NSLog(@"点击了北京");
}

-(void)navigationBarClick:(UIButton *)btn
{
    NSLog(@"点击了搜索");
}

-(void)indexBtnClick:(UIButton *)btn
{
    NSLog(@"爬山 古镇 人文 - %d",btn.tag);
    HomeContentsViewController *hcvc = [[HomeContentsViewController alloc] init];
    hcvc.hidesBottomBarWhenPushed = YES;

    if (btn.tag == 0)
    {
        
        hcvc.climbUrlStr = HomeClimb_URL;

    }
    else if (btn.tag == 1)
    {
        hcvc.climbUrlStr = AncientTown_URL;
    }
    else if (btn.tag == 2)
    {
        hcvc.climbUrlStr = Cultural_URL;
    }
    else if (btn.tag == 3)
    {
        hcvc.climbUrlStr = Barbecue_URL;
    }
    else if (btn.tag == 4)
    {
        hcvc.climbUrlStr = AvoidSummer_URL;
    }
    else if (btn.tag == 5)
    {
        hcvc.climbUrlStr = Trueman_URL;
    }
    [self.navigationController pushViewController:hcvc animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((HomeModel *)[_dataArray objectAtIndex:section]).itemsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [MyTableViewCell cellWithTableView:tableView];
    
    cell.itemModel = (ItemsModel *)[((HomeModel *)[_dataArray objectAtIndex:indexPath.section]).itemsArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 65;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section 
{
    return [SectionHeaderView headerViewWithSection:section andArray:_dataArray];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d-%d",indexPath.section,indexPath.row);
    
    ItemsModel *itMo = (ItemsModel *)[((HomeModel *)[_dataArray objectAtIndex:indexPath.section]).itemsArray objectAtIndex:indexPath.row];
    
    if (indexPath.section == 0)
    {
    
        NSString *tableViewUrlStr = [NSString stringWithFormat:Home_TableView_URL,itMo.idd];
        
        EventTravelViewController *htvc = [[EventTravelViewController alloc] init];
        htvc.hidesBottomBarWhenPushed = YES;
        htvc.travelUrlStr = tableViewUrlStr;
         
        [self.navigationController pushViewController:htvc animated:YES];
    }
    
}


-(void)viewWillAppear:(BOOL)animated
{
    self.myNavigationBar.hidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.myNavigationBar.hidden = YES;
}




@end
