//
//  FocusView.m
//  108tian
//
//  Created by SUN on 15-7-13.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "FocusView.h"
#import "ListModel.h"
#import "BannerModel.h"
#import "indexWhatModel.h"
#import "UIImageView+WebCache.h"
#import "IndexButton.h"
#import "indexWhatModel.h"
#import "HomeViewController.h"
#import "HomeImageViewController.h"
#import "SettingWebViewController.h"
#define HomeLibrary_URL @"https://api.108tian.com/mobile/v2/WeeklyDetail?id=559bd2f10cf2433ca981bd18&uuid=f5471feaca28dc58721eebb3bb0ffb0b75ae1546&timeStamp=1436963757061"

#define Garden_URL @"https://api.108tian.com/mobile/v2/WeeklyDetail?id=559bbbe50cf2433ca981bd11&uuid=f5471feaca28dc58721eebb3bb0ffb0b75ae1546&timeStamp=1436963794327"

#define WebView_URL @"http://m.108tian.com/act/qzjnh?f=android&version=4.3.10&random=1437186705033"

@interface FocusView ()

@end

@implementation FocusView
{
    UIScrollView *_scrollView;
    int _currentIndex;
    UIPageControl *_pageControl;
    NSArray *_dataArray;
    HomeViewController *_classObject;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(void)createFocusWithArray:(NSArray *)array andClass:(id)classObject andSEL:(SEL)sel
{
    
    _classObject = classObject;
    
    _dataArray = array;
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 0, 320, 100);
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.contentSize = CGSizeMake(320*3, 100);
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    [_scrollView setContentOffset:CGPointMake(320, 0)];
    
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.frame = CGRectMake(120, 80, 80, 10);
    
    _pageControl.numberOfPages = ((ListModel *)[_dataArray lastObject]).indexBannerArray.count;
    [self addSubview:_pageControl];
    
    [self layoutPage];
    // 本地写成plist文件
    NSArray *indexBtnArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"IndexButton.plist" ofType:nil]];
   
    [self createIndexButtonWithArray:indexBtnArray andClass:classObject andSEL:sel];
}

-(void)createIndexButtonWithArray:(NSArray *)array andClass:(id)classObject andSEL:(SEL)sel;
{
    int count = ((ListModel *)[_dataArray lastObject]).indexWhatArray.count;
    // 九宫格
    for (int i = 0; i < count; i++)
    {
        int row = i / 3;
        int col = i % 3;
        
        NSString *imageName = (NSString *)[array objectAtIndex:i];
    
        NSString *title = ((indexWhatModel *)[((ListModel *)[_dataArray lastObject]).indexWhatArray objectAtIndex:i]).name;
        
        IndexButton *ibtn = [IndexButton buttonWithTitle:title andFrame:CGRectMake(320 / 3.0 * col, 80 *row + 100, 320 / 3.0, 80) andImageName:imageName andClass:classObject andSEL:sel];
        
        ibtn.tag = i;
     
        [self addSubview:ibtn];
    }
    [self createIntervalView];
}


-(void)createIntervalView
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.92f alpha:1.00f];
    view.frame = CGRectMake(0, 260, 320, 10);
    [self addSubview:view];
}

-(void)layoutPage
{
    for (UIView *view in _scrollView.subviews)
    {
        [view removeFromSuperview];
    }
    UIImageView *currentImageView = [[UIImageView alloc] init];
    currentImageView.frame = CGRectMake(320, 0, 320, 100);
    
    NSString *currentUrl = ((BannerModel *)[((NSArray *)((ListModel *)[_dataArray lastObject]).indexBannerArray) objectAtIndex:_currentIndex]).img;
    NSString *strUrl = [PreURL stringByAppendingString:currentUrl];
    [currentImageView sd_setImageWithURL:[NSURL URLWithString:strUrl]];
    [_scrollView addSubview:currentImageView];

    
    int count = ((ListModel *)[_dataArray lastObject]).indexBannerArray.count;
    
    UIImageView *preImageView = [[UIImageView alloc] init];
    preImageView.frame = CGRectMake(0, 0, 320, 100);
    [preImageView sd_setImageWithURL:[NSURL URLWithString:_currentIndex - 1 < 0 ? [PreURL stringByAppendingString:((BannerModel *)[((NSArray *)((ListModel *)[_dataArray lastObject]).indexBannerArray) objectAtIndex:count - 1]).img] : [PreURL stringByAppendingString:((BannerModel *)[((NSArray *)((ListModel *)[_dataArray lastObject]).indexBannerArray) objectAtIndex:_currentIndex - 1]).img]]];
    [_scrollView addSubview:preImageView];
    
    UIImageView *nextImageView = [[UIImageView alloc] init];
    nextImageView.frame = CGRectMake(640, 0, 320, 100);
    [nextImageView sd_setImageWithURL:[NSURL URLWithString:_currentIndex + 1 < count ? [PreURL stringByAppendingString:((BannerModel *)[((NSArray *)((ListModel *)[_dataArray lastObject]).indexBannerArray) objectAtIndex:_currentIndex + 1]).img] : [PreURL stringByAppendingString:((BannerModel *)[((NSArray *)((ListModel *)[_dataArray lastObject]).indexBannerArray) objectAtIndex:0]).img]]];
    [_scrollView addSubview:nextImageView];
    
    [_scrollView setContentOffset:CGPointMake(320, 0)];
    
    // 添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [currentImageView addGestureRecognizer:tap];
    currentImageView.userInteractionEnabled = YES;
    currentImageView.tag = _currentIndex;
    
}

-(void)tapClick:(UITapGestureRecognizer *)tap
{
    NSLog(@"%d",tap.view.tag);
    if (tap.view.tag == 1 || tap.view.tag == 2)
    {
        HomeImageViewController  *hvc = [[HomeImageViewController alloc] init];
        hvc.hidesBottomBarWhenPushed = YES;
        
        if (tap.view.tag == 1)
            hvc.homeDownStr = HomeLibrary_URL;
        if (tap.view.tag ==2)
            hvc.homeDownStr = Garden_URL;

        [_classObject.navigationController pushViewController:hvc animated:YES];
    }
    if (tap.view.tag == 0)
    {
        SettingWebViewController *swvc = [[SettingWebViewController alloc] init];
        swvc.webStr = WebView_URL;
        
        swvc.hidesBottomBarWhenPushed = YES;
        [_classObject.navigationController pushViewController:swvc animated:YES];
    }
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int count = ((ListModel *)[_dataArray lastObject]).indexBannerArray.count;
    int index = scrollView.contentOffset.x/320;
    if(index<1)
    {
        _currentIndex = _currentIndex-1>=0?_currentIndex-1:count-1;
        [self layoutPage];
         
    }
    if(index>1)
    {
        _currentIndex = _currentIndex+1==count?0:_currentIndex+1;
        [self layoutPage];
        
    }
    _pageControl.currentPage = _currentIndex;
}




@end
