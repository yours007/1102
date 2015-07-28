//
//  RootViewController.m
//  108tian
//
//  Created by SUN on 15-7-12.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _myNavigationBar = [[MyNavigationBar alloc] init];
    _myNavigationBar.frame = CGRectMake(0, 20, 320, 44);
    [self.navigationController.view addSubview:_myNavigationBar];
}



@end
