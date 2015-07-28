//
//  DrawnView.m
//  108tian
//
//  Created by SUN on 15-7-15.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "DrawnView.h"

@implementation DrawnView


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 0, rect.size.height - 2);
    [[UIColor blackColor] set];
    CGContextSetLineWidth(ctx, 2);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    CGContextStrokePath(ctx);
    
    
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 6, 0);
    [[UIColor blackColor] set];
    CGContextSetLineWidth(ctx, 2);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextStrokePath(ctx);
    
    
    CGContextMoveToPoint(ctx, rect.size.width, rect.size.height);
    CGContextAddLineToPoint(ctx, rect.size.width, 2);
    [[UIColor blackColor] set];
    CGContextSetLineWidth(ctx, 2);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    CGContextStrokePath(ctx);
    
    
    CGContextMoveToPoint(ctx, rect.size.width, rect.size.height);
    CGContextAddLineToPoint(ctx, rect.size.width - 6, rect.size.height);
    [[UIColor blackColor] set];
    CGContextSetLineWidth(ctx, 1);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextStrokePath(ctx);
    

    
}

@end
