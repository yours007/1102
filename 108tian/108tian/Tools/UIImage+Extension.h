//
//  UIImage+Extension.h
// 
//
//  Created by apple on 14-7-25.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 * 传入一种颜色 返回这种颜色的图片 Quartz2D绘图(UIImage分类方法)
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
@end
