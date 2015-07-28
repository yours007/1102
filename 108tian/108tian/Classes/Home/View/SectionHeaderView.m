//
//  SectionHeaderView.m
//  108tian
//
//  Created by SUN on 15-7-13.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "SectionHeaderView.h"
#import "HomeModel.h"
#import "DrawnView.h"
@implementation SectionHeaderView

 
+(UIView *)headerViewWithSection:(NSInteger)section andArray:(NSArray *)dataArray
{
    // 背景view
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, 320, 60);
    view.backgroundColor = [UIColor whiteColor];
    UILabel *name = [[UILabel alloc] init];
    
    // 主标题
    NSString *nameText = ((HomeModel *)[dataArray objectAtIndex:section]).name;
    name.font = [UIFont systemFontOfSize:14];
    NSDictionary *dict = @{
        NSFontAttributeName : [UIFont systemFontOfSize:14]
    };
    CGSize size = [nameText boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    name.center = CGPointMake(320 / 2, 20);
    name.bounds = CGRectMake(0, 0, size.width, size.height);
    
    name.textAlignment = NSTextAlignmentCenter;
    [view addSubview:name];
    name.text = ((HomeModel *)[dataArray objectAtIndex:section]).name;
   
    // 画线
    DrawnView *drawView = [[DrawnView alloc] init];
    drawView.frame = CGRectMake(- 8, 0, name.frame.size.width + 16, name.frame.size.height);
    drawView.backgroundColor = [UIColor clearColor];
    [name addSubview:drawView];
    [drawView setNeedsDisplay];
  
    // 副标题
    UILabel *subTitle = [[UILabel alloc] init];
    subTitle.frame = CGRectMake(0, 30 + 5, 320 ,20);
    subTitle.text = ((HomeModel *)[dataArray objectAtIndex:section]).subtitle;
    subTitle.font = [UIFont systemFontOfSize:13];
    subTitle.textColor = [UIColor colorWithRed:0.62f green:0.63f blue:0.63f alpha:1.00f];
    subTitle.textAlignment = NSTextAlignmentCenter;
    [view addSubview:subTitle];
    
    return view;
}


+(UIView *)viewWithNothingCreateBlankView
{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, 320, 49);
    view.backgroundColor = [UIColor whiteColor];
    
    return view;
}


@end
