//
//  FirstStartView.m
//  108tian
//
//  Created by SUN on 15-7-12.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "FirstStartView.h"

@interface FirstStartView ()

@property (nonatomic,weak) UIImageView *bg;

@end

@implementation FirstStartView
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}


-(void)createFirstStartView
{
    [self createScrollView];
    [self createContentView];
    [self createPageControl];
    [self createEntranceBtn];
}


- (void)createScrollView
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = self.bounds;
    _scrollView.contentSize = CGSizeMake(self.bounds.size.width*3, self.bounds.size.height);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
}


- (void)createContentView
{
    UIImageView *bg1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LaunchImage-1-667h@2x.jpg"]];
    bg1.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    bg1.userInteractionEnabled = NO;
    [_scrollView addSubview:bg1];
    
    UIImageView *bg2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LaunchImage-2-667h@2x.jpg"]];
    bg2.userInteractionEnabled = NO;
    bg2.frame = CGRectMake(self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height);
    [_scrollView addSubview:bg2];
    
    UIImageView *bg3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LaunchImage-3-667h@2x.jpg"]];
    bg3.userInteractionEnabled = YES;
     bg3.frame = CGRectMake(self.bounds.size.width * 2, 0, self.bounds.size.width, self.bounds.size.height);
    [_scrollView addSubview: bg3];
    _bg = bg3;
    
    
}

-(void)createPageControl
{
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.frame = CGRectMake(130, 450, 60, 16);
    _pageControl.numberOfPages = 3;
    _pageControl.userInteractionEnabled = NO;
    _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:0.67f green:0.67f blue:0.67f alpha:1.00f];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.layer.cornerRadius = 8;
    _pageControl.layer.shadowColor = [UIColor blackColor].CGColor;
    _pageControl.layer.masksToBounds = YES;
    _pageControl.backgroundColor = [UIColor grayColor];
    // 随父控件变化
    _pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleWidth;
    [self addSubview:_pageControl];
}


-(void)createEntranceBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(105, 410, 110, 30);
    btn.backgroundColor = [UIColor clearColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_bg addSubview:btn];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x / 320;
}

-(void)btnClick:(UIButton *)btn
{
    [UIView animateWithDuration:1 animations:^{
        
        [btn removeFromSuperview];
        self.alpha = 0;
        self.transform = CGAffineTransformMakeTranslation(-320, 0);
        
    } completion:^(BOOL finished) {
    
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirstStart"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self removeFromSuperview];
        
    }];
    
    
    
    
    
}


@end
