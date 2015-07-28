//
//  SettingViewController.m
//  108tian
//
//  Created by SUN on 15-7-15.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "SettingViewController.h"
#import "MySettingTableViewCell.h"
#import "SegmentView.h"
#import "logouButton.h"
#import "SettingBackView.h"
#import "SettingWebViewController.h"
#import "SettingSuggestionViewController.h"
#import "AppDelegate.h"

#define  ContactWay_URL @"http://m.108tian.com/info/contact.html?f=ios&version=3.1.1"

#define UserAgreement_URL @"http://m.108tian.com/info/disclaimer.html/?f=ios&version=3.1.1"

@interface SettingViewController ()

@end

@implementation SettingViewController
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self loadNavigationBar];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, 44 * 5 ) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.tableHeaderView = [SegmentView createSectionViewToSetting];
    _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    _tableView.bounces = NO;
    _dataArray = [[NSMutableArray alloc] initWithObjects:@"联系方式",@"用户协议",@"意见反馈",@"给个好评",nil];
    
    // 背景view
    SettingBackView *backView = [SettingBackView viewWith:self.view];
    
    // 注销btn
    [logouButton buttonWithBackView:backView andTarget:self andAction:@selector(logoutClick)];
    
    
}


-(void)loadNavigationBar
{
    NSMutableDictionary *leftDict = [[NSMutableDictionary alloc] initWithObjects:@[@"nav_back_bar_image"] forKeys:@[@"itembgimagename"]];
    
    [self.myNavigationBar createMyNavigationBarWithBgImageName:@"blue_strip_img" andTitle:@"设置"  andLeftItemArray:@[leftDict] andRightItemArray:nil andClass:self andSEL:@selector(navigationBarClick:)];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    MySettingTableViewCell *cell = [MySettingTableViewCell cellWithTableview:tableView];
    cell.nameStr = [_dataArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了-%d-行",indexPath.row);
    if ((indexPath.row ==  0) || (indexPath.row == 1))
    {
        SettingWebViewController *swvc = [[SettingWebViewController alloc] init];
        
        indexPath.row == 0 ? (swvc.webStr = ContactWay_URL) : (swvc.webStr = UserAgreement_URL);
        
        
        [self.navigationController pushViewController:swvc animated:YES];
    }
    else if (indexPath.row == 2)
    {
        SettingSuggestionViewController *ssvc = [[SettingSuggestionViewController alloc] init];
        
        [self.navigationController pushViewController:ssvc animated:YES];
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(void)navigationBarClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)logoutClick
{
    NSLog(@"点击了注销按钮");
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
