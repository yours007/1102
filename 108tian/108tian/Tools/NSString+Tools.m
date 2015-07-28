//
//  NSString+Tools.m
//  05-新浪微博
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NSString+Tools.h"

@implementation NSString (Tools)

// self 就是调用当前成员方法的NSString对象
- (CGRect)textRectWithSize:(CGSize)size attributes:(NSDictionary *)attributes
{
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
}

/**
 *  Width = 300, 返回自适应之后的CGSzie
 */
- (CGSize)textRectWithsizeOfFont:(NSInteger)fontSize
{
   NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    CGSize size = CGSizeMake(300, CGFLOAT_MAX);
   return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}
/**
 * Width = 300, 返回自适应之后的CGFloat高度
 */
- (CGFloat)textRectWithNumOfFont:(NSInteger)fontSize
{
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    CGSize size = CGSizeMake(300, CGFLOAT_MAX);
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.height;
}

/**
 *  类方法 Width = 300 返回自适应之后的CGFloat高度
 */
+ (CGFloat)textRectWithTextStr:(NSString *)str NumOfFont:(NSInteger)fontSize
{
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    CGSize size = CGSizeMake(300, CGFLOAT_MAX);
    return [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.height;
}


@end
