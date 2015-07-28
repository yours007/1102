//
//  FavorButton.m
//  108tian
//
//  Created by SUN on 15-7-13.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "FavorButton.h"

@implementation FavorButton


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    CGFloat titleW = 40;
    CGFloat titleH = 25;
    CGFloat titleX = 12;
    CGFloat titleY = 20;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 40;
    CGFloat imageH = 32;
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}


@end
