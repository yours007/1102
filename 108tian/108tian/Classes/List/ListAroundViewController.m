//
//  ListAroundViewController.m
//  108tian
//
//  Created by SUN on 15-7-17.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "ListAroundViewController.h"
#import "DownLoadManager.h"
#import "ListAroundTableViewCell.h"
#import "ListAroundModel.h"
@interface ListAroundViewController ()

@end

@implementation ListAroundViewController
{
    DownLoadManager *_downLoadManager;
    NSMutableArray *_aroundDataArray;
    UITableView *_aroundTableView;
    UIScrollView *_aroundScrollView;
    
    UITableView *_houseTableView;
    NSMutableArray *_houseDataArray;
    
    UITableView *_holidayTableView;
    NSMutableArray *_holidayDataArray;
    
    UITableView *_pickTableView;
    NSMutableArray *_pickDataArray;
    
    UIView *_indicateView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadNavigationBar];
    
    
    
    _aroundScrollView = [[UIScrollView alloc] init];
    _aroundScrollView.frame = CGRectMake(0, 64 + 44, 320, 480 - 64 - 44);
    _aroundScrollView.delegate = self;
    _aroundScrollView.pagingEnabled = YES;
    _aroundScrollView.bounces = NO;
    _aroundScrollView.showsHorizontalScrollIndicator = NO;
    _aroundScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_aroundScrollView];
    _aroundScrollView.contentSize = CGSizeMake(320 * 4, 480 - 64 - 44);
    // 周边
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(aroundDownLoadFinished) name:_appendDownloadStr object:nil];
    _downLoadManager = [DownLoadManager sharedDownLoadManager];
    [_downLoadManager addDownLoadWithDownLoadStr:_appendDownloadStr andPage:-1 andDownLoadType:7 andIsRefresh:NO];
    
    _aroundTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480 - 64 - 44) style:UITableViewStylePlain];
    _aroundTableView.delegate = self;
    _aroundTableView.dataSource = self;
    [_aroundScrollView addSubview:_aroundTableView];
    
    
    // 农家院
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(houseDownLoadFinished) name:House_URL object:nil];
    
    [_downLoadManager addDownLoadWithDownLoadStr:House_URL andPage:-1 andDownLoadType:7 andIsRefresh:NO];
    
    _houseTableView = [[UITableView alloc] initWithFrame:CGRectMake(320 * 1, 0, 320, 480 - 64 - 44) style:UITableViewStylePlain];
    _houseTableView.delegate = self;
    _houseTableView.dataSource = self;
    [_aroundScrollView addSubview:_houseTableView];
    
    
    // 度假村
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(holidayDownLoadFinished) name:Holiday_URL object:nil];
   
    [_downLoadManager addDownLoadWithDownLoadStr:Holiday_URL andPage:-1 andDownLoadType:7 andIsRefresh:NO];
    
    _holidayTableView  = [[UITableView alloc] initWithFrame:CGRectMake(320 * 2, 0, 320, 480 - 64 - 44) style:UITableViewStylePlain];
    _holidayTableView.delegate = self;
    _holidayTableView.dataSource = self;
    [_aroundScrollView addSubview:_holidayTableView];
    
    // 采摘园
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pickDownLoadFinished) name:Pick_URL object:nil];
    
    [_downLoadManager addDownLoadWithDownLoadStr:Pick_URL andPage:-1 andDownLoadType:7 andIsRefresh:NO];
    
    _pickTableView  = [[UITableView alloc] initWithFrame:CGRectMake(320 * 3, 0, 320, 480 - 64 - 44) style:UITableViewStylePlain];
    _pickTableView.delegate = self;
    _pickTableView.dataSource = self;
    [_aroundScrollView addSubview:_pickTableView];
    
    
    
    
    NSArray *arr = @[@"周边玩",@"农家院",@"度假村",@"采摘"];
    for (int i = 0 ; i < 4; i ++)
    {
        UIButton *segBtn = [[UIButton alloc] init];
        segBtn.frame = CGRectMake(320 / 4 * i, 64 , 320 / 4, 44);
        [segBtn setTitle:[arr objectAtIndex:i] forState:UIControlStateNormal];
        [segBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [segBtn addTarget:self action:@selector(segBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        segBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        segBtn.backgroundColor = [UIColor whiteColor];
        segBtn.tag = i;
        [self.view addSubview:segBtn];
        
    }
    _indicateView = [[UIView alloc] init];
    _indicateView.frame = CGRectMake(0, 64 + 41, 320 / 4, 2);
    _indicateView.backgroundColor = [UIColor colorWithRed:0.34f green:0.78f blue:0.71f alpha:1.00f];
    [self.view addSubview:_indicateView];
    
    // 默认跳到那个界面
    [_aroundScrollView setContentOffset:CGPointMake(320 *self.pointing, 0) animated:YES];
    _indicateView.frame = CGRectMake(320 / 4 * self.pointing, 64 + 41, 320 / 4, 3);
    
}

-(void)aroundDownLoadFinished
{
    _aroundDataArray = [_downLoadManager getDataWithDownLoadStr:_appendDownloadStr];
    [_aroundTableView reloadData];
}

-(void)houseDownLoadFinished
{
    _houseDataArray = [_downLoadManager getDataWithDownLoadStr:House_URL];
    [_houseTableView reloadData];
}
 
-(void)holidayDownLoadFinished
{
    _holidayDataArray = [_downLoadManager getDataWithDownLoadStr:Holiday_URL];
    [_holidayTableView reloadData];
}

-(void)pickDownLoadFinished
{
    _pickDataArray = [_downLoadManager getDataWithDownLoadStr:Pick_URL];
    [_pickTableView reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == _aroundTableView)
    {
        return _aroundDataArray.count;
    }
    else if (tableView == _houseTableView)
    {
        return _houseDataArray.count;
    }
    else if (tableView == _holidayTableView)
    {
        return  _holidayDataArray.count;
    }
    else if (tableView == _pickTableView)
    {
        return _pickDataArray.count;
    }
    else
        return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *shadoubuhuia = @"day";
    ListAroundTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shadoubuhuia];
    
    if (cell == nil)
    {
        cell = [[ListAroundTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:shadoubuhuia];
    }
    
    if (tableView == _aroundTableView)
    {
    
        cell.aroModel = [_aroundDataArray objectAtIndex:indexPath.row];
    }
    else if (tableView == _houseTableView)
    {
        cell.aroModel = [_houseDataArray objectAtIndex:indexPath.row];
    }
    else if (tableView == _holidayTableView)
    {
        cell.aroModel = [_holidayDataArray objectAtIndex:indexPath.row];
    }
    else if (tableView == _pickTableView)
    {
        ListAroundModel *arcModel = (ListAroundModel *)[_pickDataArray objectAtIndex:indexPath.row];
        arcModel.isOtherType = YES;
        cell.aroModel = arcModel;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 240;
}

-(void)loadNavigationBar
{
     NSMutableDictionary *leftDict = [[NSMutableDictionary alloc] initWithObjects:@[@"nav_back_bar_image"] forKeys:@[@"itembgimagename"]];
    
    NSMutableDictionary *rightDict = [[NSMutableDictionary alloc] initWithObjects:@[@"active_nav_right_btn"] forKeys:@[@"itembgimagename"]];
    
    [self.myNavigationBar createMyNavigationBarWithBgImageName:@"blue_strip_img" andTitle:@"周边景点"  andLeftItemArray:@[leftDict] andRightItemArray:@[rightDict] andClass:self andSEL:@selector(navigationBarClick:)];
}

-(void)navigationBarClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / 320;
    _indicateView.frame = CGRectMake(320 / 4 * index, 64 + 41, 320 / 4, 3);
}




-(void)viewWillAppear:(BOOL)animated
{
    self.myNavigationBar.hidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.myNavigationBar.hidden = YES;
}

-(void)segBtnClick:(UIButton *)btn
{
    NSLog(@"%d",btn.tag);
    
    [_aroundScrollView setContentOffset:CGPointMake(320 *btn.tag, 0) animated:YES];
    _indicateView.frame = CGRectMake(320 / 4 * btn.tag, 64 + 41, 320 / 4, 3);
    
}


@end
