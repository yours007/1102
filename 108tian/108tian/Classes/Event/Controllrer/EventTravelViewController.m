//
//  EventTravelViewController.m
//  108tian
//
//  Created by SUN on 15-7-16.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "EventTravelViewController.h"
#import "DownLoadManager.h"
#import "EventTravelModel.h"
#import "UIImageView+WebCache.h"
#import "EventTravelProductModel.h"
#import "UIImage+Extension.h"
#import "NSString+Tools.h"
#import "EventTravelScrollView.h"

@interface EventTravelViewController ()

@end

@implementation EventTravelViewController
{
    DownLoadManager *_downLoadManager;
    NSMutableArray *_travelDataArray;
    EventTravelScrollView *_travelScrollView;
    UIView *_shareView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadNavigationBar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(travelDownLoadFinished) name:self.travelUrlStr object:nil];
    
    _downLoadManager = [DownLoadManager sharedDownLoadManager];
    [_downLoadManager addDownLoadWithDownLoadStr:self.travelUrlStr andPage:-1 andDownLoadType:5 andIsRefresh:NO];
    
    [self createShareView];
    
    
    if (_travelDataArray)
    {
        [self travelDownLoadFinished];
    }
    
}

-(void)travelDownLoadFinished
{
    _travelDataArray = [_downLoadManager getDataWithDownLoadStr:self.travelUrlStr];
    EventTravelModel *traModel = [_travelDataArray lastObject];
    
    _travelScrollView = [[EventTravelScrollView alloc] init];
    
    _travelScrollView.frame = CGRectMake( 0 , 20 , 320 , 480 - 20);
   
    _travelScrollView.delegate = self;
    
    [_travelScrollView createScrollViewWithModel:traModel andNaVigation:self.myNavigationBar andTarget:self andAction:@selector(eventTravelScrollViewBtnClick:)];
    
    [self.view addSubview:_travelScrollView];
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
        _shareView.hidden = NO;
        
    }
}

-(void)createShareView
{
    _shareView = [[UIView alloc] init];
    _shareView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0.f alpha:0.1];
    _shareView.frame = CGRectMake(0, 0, 320, 480);
    _shareView.hidden = YES;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClcik)];
    
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    
    [_shareView addGestureRecognizer:tap];

    
    
    
    self.navigationController.view.userInteractionEnabled = YES;
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 380, 320, 100);
    view.backgroundColor = [UIColor colorWithRed:0.58f green:0.53f blue:0.24f alpha:1.00f];
    [_shareView addSubview:view];
    [self.navigationController.view addSubview:_shareView];

    
    NSArray *arr = @[@"qqzone",@"weibo",@"weixin",@"friendscircle"];
    
    for (int i = 0; i < 4; i ++)
    {
        UIButton *btn = [[UIButton alloc] init];
        btn.frame =CGRectMake(25 + (60 + 10) * i , 20,  60, 60);
        btn.backgroundColor = [UIColor clearColor];
        [btn setImage:[UIImage imageNamed:[arr objectAtIndex:i]] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [view addSubview:btn];
    }
    
}


-(void)eventTravelScrollViewBtnClick:(UIButton *)btn
{
    if (btn.tag == 1)
    {
        NSLog(@"点击了购买");
    }
    else if (btn.tag == 2)
    {
        NSLog(@"点击了电话");
    }
}

-(void)shareBtnClick:(UIButton *)btn
{
    NSLog(@"%d",btn.tag);
}

-(void)viewWillAppear:(BOOL)animated
{
    
}


-(void)viewWillDisappear:(BOOL)animated
{
    self.myNavigationBar.hidden = YES;
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


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


-(void)tapClcik
{
    _shareView.hidden = YES;
}


@end
