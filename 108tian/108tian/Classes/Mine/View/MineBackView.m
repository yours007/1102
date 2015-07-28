//
//  MineBackView.m
//  108tian
//
//  Created by SUN on 15-7-15.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "MineBackView.h"

@implementation MineBackView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(void)createBackViewWithView:(UIView *)tableView
{
    UIView *backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, 20 + 44, 320, tableView.bounds.size.height - 64);
    backView.backgroundColor = [UIColor whiteColor];
    [tableView addSubview:backView];
}


@end
