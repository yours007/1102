//
//  HomeContentsViewController.m
//  108tian
//
//  Created by SUN on 15-7-17.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "HomeContentsViewController.h"
#import "DownLoadManager.h"
#import "ContentTableViewCell.h"
#import "ContentModel.h"
@interface HomeContentsViewController ()

@end

@implementation HomeContentsViewController
{
    DownLoadManager *_downLoadManager;
    UITableView *_tableView;
    NSString *_HomeDownLoadUrl;
    NSMutableArray *_dataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _HomeDownLoadUrl = _climbUrlStr;
    
    
    
    _downLoadManager = [DownLoadManager sharedDownLoadManager];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homeContectDownLoadFinished) name:_HomeDownLoadUrl object:nil];
    
    [_downLoadManager addDownLoadWithDownLoadStr:_HomeDownLoadUrl andPage:-1 andDownLoadType:8 andIsRefresh:NO];
    
    
    
    
    
    [self loadNavigationBar];
    
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(0, 64, 320, 480 - 64);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

-(void)homeContectDownLoadFinished
{
    _dataArray = [_downLoadManager getDataWithDownLoadStr:_HomeDownLoadUrl];
    [_tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *soi = @"5151";
    ContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:soi];
    if (cell == nil)
    {
        cell = [[ContentTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:soi];
    }
    cell.conModel = [_dataArray objectAtIndex:indexPath.row];
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
    if (btn.tag ==0)
    {
        [self.navigationController popViewControllerAnimated:YES];
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
