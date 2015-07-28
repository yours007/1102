//
//  MineInteractButton.m
//  108tian
//
//  Created by SUN on 15-7-15.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "MineInteractButton.h"

@implementation MineInteractButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(void)buttonWithLoginBtnAndView:(UIView *)tableView andTarget:(id)target andAction:(SEL)action
{
    UIImageView *loginImageView = [[UIImageView alloc] init];
    loginImageView.frame = CGRectMake(35, 175, 250, 45);
    loginImageView.image = [UIImage imageNamed:@"personal_login_btn_bg"];
    [tableView addSubview:loginImageView];
    
    
    MineInteractButton *loginBtn = [[MineInteractButton alloc] init];
    loginBtn.frame = CGRectMake(35, 175, 250, 45);
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor colorWithRed:0.33f green:0.76f blue:0.71f alpha:1.00f] forState:UIControlStateNormal];
    [loginBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [tableView addSubview:loginBtn];

}


+(void)buttonWithRegisterBtnAndForgetBtnWithView:(UIView *)tableView andTarget:(id)target andAction:(SEL)action
{
    MineInteractButton *registerBtn = [[MineInteractButton alloc] init];
    registerBtn.frame = CGRectMake(40, 240, 40, 20);
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor colorWithRed:0.33f green:0.76f blue:0.71f alpha:1.00f] forState:UIControlStateNormal];
    registerBtn.tag = 1;
    [registerBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [tableView addSubview:registerBtn];
    
    UIButton *forgetBtn = [[UIButton alloc] init];
    forgetBtn.frame = CGRectMake(190, 240, 70, 20);
    [forgetBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor colorWithRed:0.33f green:0.76f blue:0.71f alpha:1.00f] forState:UIControlStateNormal];
    forgetBtn.tag = 2;
    [forgetBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [tableView addSubview:forgetBtn];
    
    
    
    UIImageView *lineImageView3 = [[UIImageView alloc] init];
    lineImageView3.frame = CGRectMake(40, 289, 240, 2);
    lineImageView3.image = [UIImage imageNamed:@"login_setting_across_line"];
    [tableView addSubview:lineImageView3];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 280, 120, 20);
    label.text = @"使用社交账号登陆";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor lightGrayColor];
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [tableView addSubview:label];

}


+(void)buttonWithsocialBtnaAndView:(UIView *)tableView andTarget:(id)target andAction:(SEL)action
{
    NSArray *array = @[@"mine_login_qq",@"mine_login_wx",@"mine_login_weibo"];
    for (NSInteger i = 0; i < 3; i ++)
    {
        CGFloat BtnX = 10;
        CGFloat BtnY = 310;
        CGFloat BtnW = 100;
        CGFloat BtnH = 100;
        
        UIButton *socialBtn = [[UIButton alloc] init];
        socialBtn.frame = CGRectMake(BtnX + BtnW * i, BtnY , BtnW, BtnH);
        UIImage *image = [UIImage imageNamed:[array objectAtIndex:i]];
        [socialBtn setImage:image forState:UIControlStateNormal];
        socialBtn.tag = i;
        [socialBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [tableView addSubview:socialBtn];
    }
}


@end
