//
//  SettingWebViewController.m
//  108tian
//
//  Created by SUN on 15-7-16.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "SettingWebViewController.h"

@interface SettingWebViewController ()

@end

@implementation SettingWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadNavigationBar];
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = CGRectMake(0, 64, 320, 480);
    
    NSURL *url = [NSURL URLWithString:_webStr];
    
    
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
    
//    [webView sizeToFit];
    [self.view addSubview:webView];
}





-(void)loadNavigationBar
{
    NSMutableDictionary *leftDict = [[NSMutableDictionary alloc] initWithObjects:@[@"nav_back_bar_image"] forKeys:@[@"itembgimagename"]];
    
    [self.myNavigationBar createMyNavigationBarWithBgImageName:@"blue_strip_img" andTitle:@"联系我们"  andLeftItemArray:@[leftDict] andRightItemArray:nil andClass:self andSEL:@selector(navigationBarClick:)];
}

-(void)navigationBarClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
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
