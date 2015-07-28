//
//  HomeModel.m
//  108tian
//
//  Created by SUN on 15-7-13.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _itemsArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        _idd = value;
    }
}

@end
