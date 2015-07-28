//
//  MineViewController.m
//  108tian
//
//  Created by SUN on 15-7-12.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "MineViewController.h"
#import "SettingViewController.h"
#import "MineInputTextField.h"
#import "MineInteractButton.h"
#import "MineBackView.h"
#import "MyTabbar.h"

@implementation MineViewController
{
    MineInputTextField *_phoneTextField;
    MineInputTextField *_passWordTextField;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadNavigationBar];

    // 背景颜色
    [MineBackView createBackViewWithView:self.view];

    // 账号
    _phoneTextField = [MineInputTextField  texFieldPhoneWith:self.view];
 
    // 密码
    _passWordTextField = [MineInputTextField texFieldPassWordWith:self.view];
   
    // 登陆
    [MineInteractButton  buttonWithLoginBtnAndView:self.view andTarget:self andAction:@selector(logoutClick)];
  
    // 注册 和 忘记密码
    [MineInteractButton buttonWithRegisterBtnAndForgetBtnWithView:self.view andTarget:self andAction:@selector(registerBtnAndForgetBtnClick:)];
    
    // 社交登陆
    [MineInteractButton buttonWithsocialBtnaAndView:self.view andTarget:self andAction:@selector(socialBtnClick:)];
    
}

-(void)loadNavigationBar
{
    NSMutableDictionary *rightDict = [[NSMutableDictionary alloc] initWithObjects:@[@"personal_setting_icon@2x"] forKeys:@[@"itembgimagename"]];
    
    [self.myNavigationBar createMyNavigationBarWithBgImageName:@"blue_strip_img" andTitle:self.vcTitle  andLeftItemArray:nil andRightItemArray:@[rightDict] andClass:self andSEL:@selector(navigationBarClick:)];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_phoneTextField resignFirstResponder];
    [_passWordTextField resignFirstResponder];
}

-(void)navigationBarClick:(UIButton *)btn
{
    NSLog(@"点击了设置");
    SettingViewController *svc = [[SettingViewController alloc] init];
    svc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:svc animated:YES];
}



-(void)logoutClick
{
    NSLog(@"点击了登陆");
}

-(void)registerBtnAndForgetBtnClick:(UIButton *)btn
{
    if (btn.tag == 1)
    {
        NSLog(@"点击了注册");
    }
    else
    {
        NSLog(@"点击了忘记密码");
    }
}

-(void)socialBtnClick:(UIButton *)btn
{
    if (btn.tag == 0)
    {
        NSLog(@"点击了企鹅");
    }
    else if (btn.tag == 1)
    {
        NSLog(@"点击了微信");
    }
    else
    {
        NSLog(@"点击了新浪");
    }
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
