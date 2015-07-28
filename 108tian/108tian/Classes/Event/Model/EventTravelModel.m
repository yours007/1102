//
//  EventTravelModel.m
//  108tian
//
//  Created by SUN on 15-7-16.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "EventTravelModel.h"

@implementation EventTravelModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        _productArray = [[NSMutableArray alloc] init];
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
