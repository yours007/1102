//
//  HomeImageViewController.m
//  108tian
//
//  Created by SUN on 15-7-18.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "HomeImageViewController.h"
#import "DownLoadManager.h"
#import "UIImageView+WebCache.h"
#import "HomeFaModel.h"


@interface HomeImageViewController ()<UIScrollViewDelegate>

@end

@implementation HomeImageViewController
{
    DownLoadManager *_downLoadManager;
    NSMutableArray *_dataArray;
    UIScrollView *_scrollView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadNavigationBar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinished) name:self.homeDownStr object:nil];
    _downLoadManager = [DownLoadManager sharedDownLoadManager];
    [_downLoadManager addDownLoadWithDownLoadStr:self.homeDownStr andPage:-1 andDownLoadType:9 andIsRefresh:NO];
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 64, 320, 480);
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake(320, 1500);
    
    
    if (_dataArray)
    {
        [self downLoadFinished];
    }
    
    
}


-(void)downLoadFinished
{
    _dataArray = [_downLoadManager getDataWithDownLoadStr:self.homeDownStr];
    HomeFaModel *hfm = (HomeFaModel *)[_dataArray lastObject];
    
    
    
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0 ,320, 150);
    
    NSString *fullImageNameUrl = [PreURL stringByAppendingString:hfm.headImg];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:fullImageNameUrl]];
     
    [_scrollView addSubview:imageView];
    
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = CGRectMake(0, 150, 320, 1480);
    
    
    [webView sizeThatFits:CGSizeMake(320, 1000)];
    [webView loadHTMLString:hfm.content baseURL:nil];
    
    [_scrollView addSubview:webView];
    

    
    
    
    
}



-(void)loadNavigationBar
{
    NSMutableDictionary *leftDict = [[NSMutableDictionary alloc] initWithObjects:@[@"nav_back_bar_image"] forKeys:@[@"itembgimagename"]];
    
    NSMutableDictionary *rightDict = [[NSMutableDictionary alloc] initWithObjects:@[@"active_nav_right_btn"] forKeys:@[@"itembgimagename"]];
    
    [self.myNavigationBar createMyNavigationBarWithBgImageName:@"blue_strip_img" andTitle:@""  andLeftItemArray:@[leftDict] andRightItemArray:@[rightDict] andClass:self andSEL:@selector(navigationBarClick:)];
}

-(void)navigationBarClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
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
