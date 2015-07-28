//
//  ListColHeaderView.m
//  108tian
//
//  Created by SUN on 15-7-17.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "ListColHeaderView.h"
#import "UIImageView+WebCache.h"
#import "ListCollectionModel.h"

@implementation ListColHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(UIView *)viewWithArray:(NSArray *)array
{
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, 320, 220);
    
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = view.bounds;
    
    NSString *str = ((ListCollectionModel *)[array objectAtIndex:0]).headImg;
    NSString *fullImageUrlStr = [PreURL stringByAppendingString:str];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:fullImageUrlStr]];
    
    [view addSubview:imageView];
    
    return view;
    
    
}

@end
