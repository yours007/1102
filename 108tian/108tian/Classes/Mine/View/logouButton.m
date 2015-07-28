//
//  logouButton.m
//  108tian
//
//  Created by SUN on 15-7-15.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "logouButton.h"
#import "UIImage+Extension.h"

@implementation logouButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


+(void)buttonWithBackView:(UIView *)backView andTarget:(id)target andAction:(SEL)action
{
    UIButton *logoutBtn = [[UIButton alloc] init];
    logoutBtn.frame = CGRectMake(40, 15, 240, 35);
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithRed:0.34f green:0.78f blue:0.71f alpha:1.00f]];
    [logoutBtn setBackgroundImage:image forState:UIControlStateNormal];
    [logoutBtn setTitle:@"注销" forState:UIControlStateNormal];
    [logoutBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    logoutBtn.layer.cornerRadius = 3;
    logoutBtn.layer.masksToBounds = YES;
    [backView addSubview:logoutBtn];
}

@end
