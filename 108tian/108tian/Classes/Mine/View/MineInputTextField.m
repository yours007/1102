//
//  MineInputTextField.m
//  108tian
//
//  Created by SUN on 15-7-15.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "MineInputTextField.h"

@implementation MineInputTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(MineInputTextField *)texFieldPhoneWith:(UIView *)tableView
{
    // 账号
    MineInputTextField *phoneTextField = [[MineInputTextField alloc] init];
    phoneTextField.frame = CGRectMake(40, 90, 160, 30);
    phoneTextField.backgroundColor = [UIColor whiteColor];
    phoneTextField.placeholder = @"请输入电话号";
    phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    [tableView addSubview:phoneTextField];
    
    UIImageView *lineImageView = [[UIImageView alloc] init];
    lineImageView.frame = CGRectMake(40, 120, 240, 2);
    lineImageView.image = [UIImage imageNamed:@"login_setting_across_line"];
    [tableView addSubview:lineImageView];
    
    return phoneTextField;
}


+(MineInputTextField *)texFieldPassWordWith:(UIView *)tableView
{
    // 密码
     MineInputTextField *passWordTextField = [[MineInputTextField alloc] init];
    passWordTextField.frame = CGRectMake(40, 125, 160, 30);
    passWordTextField.backgroundColor = [UIColor whiteColor];
    passWordTextField.placeholder = @"请输入密码";
    passWordTextField.secureTextEntry = YES;
    [tableView addSubview:passWordTextField];
    
    UIImageView *lineImageView1 = [[UIImageView alloc] init];
    lineImageView1.frame = CGRectMake(40, 155, 240, 2);
    lineImageView1.image = [UIImage imageNamed:@"login_setting_across_line"];
    [tableView addSubview:lineImageView1];
    
    return passWordTextField;
}

@end
