//
//  HomeFaModel.m
//  108tian
//
//  Created by SUN on 15-7-18.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "HomeFaModel.h"

@implementation HomeFaModel


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        _idd = value;
    }
}

@end
