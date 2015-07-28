//
//  ListViewController.m
//  108tian
//
//  Created by SUN on 15-7-12.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "ListViewController.h"
#import "DownLoadManager.h"
#import "MyCollectionViewCell.h"
#import "ListModels.h"
#import "classifyModel.h"
#import "DetailModel.h"
#import "HeaderView.h"
#import "MJRefresh.h"
#import "ListCollectionViewController.h"
#import "ListAroundViewController.h"


#define ListDetail_URL @"https://api.108tian.com/mobile/v2/RecommendList?uuid=8ea4f0cd0ccbbce5a96f322c5a35b8d4ace78b91&cityId=1&step=10&page=%d"
#define ListCollection_URL @"https://api.108tian.com/mobile/v2/RecommendDetail?id=%@&timeStamp=1436964797990"

#define parentChild_URL @"https://api.108tian.com/mobile/v2/RecommendDetail?id=558d2afb0cf2d2382e882f72&timeStamp=1436964674581"

#define lovers_URL @"https://api.108tian.com/mobile/v2/RecommendDetail?id=558d30f00cf2d2382e882f75&timeStamp=1436964710964"

#define Teams_URL @"https://api.108tian.com/mobile/v2/RecommendDetail?id=53f421730cf2ac6a1383e719&timeStamp=1436964750654"




@interface ListViewController ()

@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation ListViewController
{
    DownLoadManager *_downLoadManager;
    NSMutableArray *_detailArray;
    HeaderView *_view;
    NSInteger _page;
    BOOL _isListFooterDownLoadFlag;
}

static NSString *cellName = @"cell";

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 导航条
    [self loadNavigationBar];
    _page = 0;
    _isListFooterDownLoadFlag = NO;
    // collectionView初始化
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, 320, 480 - 64) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:cellName];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView"];
    [self.view addSubview:self.collectionView];
    
    #pragma self.collectionView不等于self.view
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // 下载
    _downLoadManager = [DownLoadManager sharedDownLoadManager];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinished) name:ListDetail_URL object:nil];
    [_downLoadManager addDownLoadWithDownLoadStr:ListDetail_URL andPage:_page andDownLoadType:2 andIsRefresh:NO];
 
    // 头视图
    _view = [[HeaderView alloc] init];
     _view.frame = CGRectMake(0, 0, 320, 270);
   
    // 玩法分类
    [_view createHeaderViewWithTarget:self andAction:@selector(sortBtnClick:)];
  
    // 人群分类
    [_view createCrowdButtonWithTarget:self andAction:@selector(crowdBtnClick:)];
   
    // 精选
    [_view createSelectionView];
    
    // 触底加载
    _collectionView.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshed1)];

    
}

-(void)downLoadFinished
{
    _detailArray = [_downLoadManager getDataWithDownLoadStr:ListDetail_URL];
    [_collectionView reloadData];
    _isListFooterDownLoadFlag = NO;
    
}

-(void)refreshed1
{
    if (!_isListFooterDownLoadFlag)
    {
        NSLog(@"触底加载");
        _isListFooterDownLoadFlag = YES;
        _page = _page + 1;
        NSLog(@"%d",_page);
        [_downLoadManager addDownLoadWithDownLoadStr:ListDetail_URL andPage:_page andDownLoadType:2 andIsRefresh:NO];
    }
    else
    {
        NSLog(@"正在触底加载中---");
    }
    [_collectionView.footer endRefreshing];
}

// item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
 
    return _detailArray.count;
}

// 组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellName forIndexPath:indexPath];
    
    
    cell.deModel = [_detailArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((320 - 30) / 2.0, (320 - 30) / 2.0);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

// 选中调用
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",indexPath.row);
    
    DetailModel *dm = (DetailModel *)[_detailArray objectAtIndex:indexPath.row];
    NSString *collectionUrl = [NSString stringWithFormat:ListCollection_URL,dm.idd];
    NSLog(@"%@",collectionUrl);
    
    
    ListCollectionViewController *lcvc = [[ListCollectionViewController alloc] init];
    lcvc.collectionUrl = collectionUrl;
    lcvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:lcvc animated:YES];
    
    
    
}


// header
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(320, 270);
}

// footer
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(320, 49);
}

// header && footer
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    
    if (kind == UICollectionElementKindSectionHeader)
    {
    
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        
        [headerView addSubview:_view];
        
        reusableView = headerView;
    }
    
    if (kind == UICollectionElementKindSectionFooter)
    {
        UICollectionReusableView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView" forIndexPath:indexPath];
        reusableView = footView;
    }
        return reusableView;
}




-(void)loadNavigationBar
{
    [self.myNavigationBar createMyNavigationBarWithBgImageName:@"blue_strip_img" andTitle:self.vcTitle  andLeftItemArray:nil andRightItemArray:nil andClass:nil andSEL:nil];
}


-(void)sortBtnClick:(UIButton *)btn
{
    NSLog(@"玩法分类 - %d",btn.tag);
    
    ListAroundViewController *lavc = [[ListAroundViewController alloc] init];
    lavc.hidesBottomBarWhenPushed = YES;
    lavc.pointing = btn.tag;
    lavc.appendDownloadStr = Around_URL;
    [self.navigationController pushViewController:lavc animated:YES];
    
}

-(void)crowdBtnClick:(UIButton *)btn
{
    NSLog(@"人群分类 - %d",btn.tag);
     ListCollectionViewController *lcvc = [[ListCollectionViewController alloc] init];
    if (btn.tag  == 0)
    {
        lcvc.collectionUrl = parentChild_URL;

    }else if (btn.tag == 1)
    {
        lcvc.collectionUrl = lovers_URL;
    }
    else if (btn.tag == 2)
    {
        lcvc.collectionUrl = Teams_URL;
    }
    [self.navigationController pushViewController:lcvc animated:YES];
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
