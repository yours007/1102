//
//  ListModel.m
//  108tian
//
//  Created by SUN on 15-7-13.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _indexBannerArray = [[NSMutableArray alloc] init];
        _indexWhatArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
 
}

@end
