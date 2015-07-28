//
//  CrowdButton.m
//  108tian
//
//  Created by SUN on 15-7-14.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "CrowdButton.h"

@implementation CrowdButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:14]
                           };
    CGFloat titleW = 0;
    
    titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.width;
    
    CGFloat titleH = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.height;
    
    CGFloat titleX = contentRect.size.width - titleW - 10 - 5;
    CGFloat titleY = (contentRect.size.height - titleH)/2.0;
    
    
    return CGRectMake(titleX, titleY, titleW, titleH);
    
}


-(void)setHighlighted:(BOOL)highlighted
{
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = self.currentImage.size.height;
    CGFloat imageH = self.currentImage.size.height;
    CGFloat imageX = 10 + 5;
    CGFloat imageY = (contentRect.size.height - self.currentImage.size.height) / 2.0;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end
