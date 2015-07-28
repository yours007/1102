//
//  SegmentView.m
//  108tian
//
//  Created by SUN on 15-7-14.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "SegmentView.h"

@implementation SegmentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(SegmentView *)viewWithTarget:(id)target andAction:(SEL)action
{
    SegmentView *segmentView = [[SegmentView alloc] init];
    
    segmentView.frame = CGRectMake(0, 64, 320, 44);
    segmentView.backgroundColor = [UIColor whiteColor];
    
    
    NSArray *array = @[@"全部",@"旅游运动",@"体育运动",@"生活聚会",@"免费体检"];
    for (int i = 0; i < 5; i ++)
    {
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = CGRectMake(320 / 5 * i, 0, 320 / 5, 44);
        [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        btn.tag = i;
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [segmentView addSubview:btn];
    }
    
    return segmentView;
}


+(SegmentView *)createBlankView
{
    SegmentView *seg = [[SegmentView alloc] init];
    seg.frame = CGRectMake(0, 0, 320, 40);
    seg.backgroundColor = [UIColor whiteColor];
    
    return seg;
}
 
+(SegmentView *)createSectionViewToSetting
{
    SegmentView *seg = [[SegmentView alloc] init];
    seg.frame = CGRectMake(0, 0, 320, 44);
    seg.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.92f alpha:1.00f];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"关于我们";
    label.font = [UIFont systemFontOfSize:15];
    label.frame = CGRectMake(15, 0, 320, 44);
    [seg addSubview:label];
    
    return seg;
}
@end
