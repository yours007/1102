//
//  ListModels.m
//  108tian
//
//  Created by SUN on 15-7-14.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "ListModels.h"

@implementation ListModels

- (instancetype)init
{
    self = [super init];
    if (self) {
        _classifyArray = [[NSMutableArray alloc] init];
        _listArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
