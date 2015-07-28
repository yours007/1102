//
//  SettingBackView.m
//  108tian
//
//  Created by SUN on 15-7-15.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "SettingBackView.h"

@implementation SettingBackView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
    
}



+(SettingBackView *) viewWith:(UIView *)tableview
{
    SettingBackView *backView = [[SettingBackView alloc] init];
    backView.frame =CGRectMake(0, 64 + 44 * 5, 320, [UIScreen mainScreen].bounds.size.height - 64 - 44 * 5);
    backView.backgroundColor  = [UIColor colorWithRed:0.92f green:0.92f blue:0.92f alpha:1.00f];
    [tableview addSubview:backView];
    
    return backView;
}


@end
