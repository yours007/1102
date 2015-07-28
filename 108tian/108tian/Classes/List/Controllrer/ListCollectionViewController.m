//
//  ListCollectionViewController.m
//  108tian
//
//  Created by SUN on 15-7-17.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "ListCollectionViewController.h"
#import "DownLoadManager.h"
#import "ListCollectionModel.h"
#import "ListSubCollectionModel.h"
#import "ListSubCollectionFrameModel.h"
#import "ListColTableViewCell.h"
#import "ListColHeaderView.h"
#import "UIImageView+WebCache.h"

@interface ListCollectionViewController ()

@end

@implementation ListCollectionViewController
{
    DownLoadManager *_downLoadManager;
    NSMutableArray *_listCollectDataArray;
    UITableView *_tableView;
    UIView *_headerView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadNavigationBar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listColectionDownLoadFinished) name:self.collectionUrl object:nil];
    _downLoadManager = [DownLoadManager sharedDownLoadManager ];
    [_downLoadManager addDownLoadWithDownLoadStr:self.collectionUrl andPage:-1 andDownLoadType:6 andIsRefresh:NO];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 320, 480 - 20) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    _headerView = [[UIView alloc] init];
    _headerView.frame = CGRectMake(0, 0, 320, 200);
    _tableView.tableHeaderView = _headerView;
   
    [self.view addSubview:_tableView];
    
    self.myNavigationBar.iv.alpha = 0;
    
    
    if (_listCollectDataArray)
    {
        [self createHeaderView];
    }
    
}


-(void)listColectionDownLoadFinished
{
    _listCollectDataArray = [_downLoadManager getDataWithDownLoadStr:self.collectionUrl];
    
    [_tableView reloadData];
    [self createHeaderView];
}


-(void)createHeaderView
{

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 320, 200);
    
    NSString *str = ((ListCollectionModel *)[_listCollectDataArray objectAtIndex:0]).headImg;
    NSString *fullImageUrlStr = [PreURL stringByAppendingString:str];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:fullImageUrlStr]];
    
    [_headerView addSubview:imageView];
    
    

    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(0, 80, 320, 20);
    nameLabel.text = ((ListCollectionModel *)[_listCollectDataArray objectAtIndex:0]).name;
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [imageView addSubview:nameLabel];
    
    
    UILabel *subTitleLabel = [[UILabel alloc] init];
    subTitleLabel.frame = CGRectMake(0, 120, 320, 20);
    subTitleLabel.text = ((ListCollectionModel *)[_listCollectDataArray objectAtIndex:0]).subtitle;
    subTitleLabel.font = [UIFont systemFontOfSize:15];
    subTitleLabel.textColor = [UIColor whiteColor];
    subTitleLabel.textAlignment = NSTextAlignmentCenter;
    [imageView addSubview:subTitleLabel];

    
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((ListCollectionModel *)[_listCollectDataArray lastObject]).itemsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *buxiangqimingzile = @"meidemingzile";
    
    ListColTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:buxiangqimingzile];
    
    if (cell == nil)
    {
        cell = [[ListColTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:buxiangqimingzile];
    }
    cell.frameModel = [((ListCollectionModel *)[_listCollectDataArray lastObject]).itemsArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ((ListSubCollectionFrameModel *)[((ListCollectionModel *)[_listCollectDataArray lastObject]).itemsArray objectAtIndex:indexPath.row]).Height ;
            
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",indexPath.row);
    
}



-(void)loadNavigationBar
{
    NSMutableDictionary *leftDict = [[NSMutableDictionary alloc] initWithObjects:@[@"nav_back_bar_image"] forKeys:@[@"itembgimagename"]];
    
    NSMutableDictionary *rightDict = [[NSMutableDictionary alloc] initWithObjects:@[@"nav_share"] forKeys:@[@"itembgimagename"]];
    
    [self.myNavigationBar createMyNavigationBarWithBgImageName:@"blue_strip_img" andTitle:nil  andLeftItemArray:@[leftDict] andRightItemArray:@[rightDict] andClass:self andSEL:@selector(navigationBarClick:)];
    
    self.myNavigationBar.iv.alpha = 0;
    
}

-(void)navigationBarClick:(UIButton *)btn
{
    if (btn.tag == 0)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"点击了分享");
    }
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    self.myNavigationBar.iv.alpha =  scrollView.contentOffset.y / 350.0;
    if (scrollView.contentOffset.y > 350)
    {
        self.myNavigationBar.iv.alpha = 1;
    }
    
    if (scrollView.contentOffset.y <= -40)
    {
        scrollView.bounces = NO;
    }
    scrollView.bounces = YES;
    
    
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
