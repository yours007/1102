//
//  HomeTabViewController.m
//  108tian
//
//  Created by SUN on 15-7-15.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "HomeTabViewController.h"
#import "DownLoadManager.h"

@interface HomeTabViewController ()

@end

@implementation HomeTabViewController
{
    DownLoadManager *_downLoadManger;
    NSMutableArray *_homeTabDataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadNavigationBar];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homeTabDownLoadFinished) name:self.tableViewUrlStr object:nil];
    _downLoadManger = [DownLoadManager sharedDownLoadManager];
    [_downLoadManger addDownLoadWithDownLoadStr:self.tableViewUrlStr andPage:0 andDownLoadType:4 andIsRefresh:NO];
}

-(void)homeTabDownLoadFinished
{
    _homeTabDataArray = [_downLoadManger getDataWithDownLoadStr:self.tableViewUrlStr];
}


-(void)loadNavigationBar
{
    NSMutableDictionary *leftDict = [[NSMutableDictionary alloc] initWithObjects:@[@"nav_back_bar_image"] forKeys:@[@"itembgimagename"]];
    
    NSMutableDictionary *rightDict = [[NSMutableDictionary alloc] initWithObjects:@[@"nav_share"] forKeys:@[@"itembgimagename"]];
    
    [self.myNavigationBar createMyNavigationBarWithBgImageName:@"blue_strip_img" andTitle:nil  andLeftItemArray:@[leftDict] andRightItemArray:@[rightDict] andClass:self andSEL:@selector(navigationBarClick:)];
    
    
}

-(void)navigationBarClick:(UIButton *)btn
{
    if (btn.tag == 0)
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
