//
//  ListAroundModel.h
//  108tian
//
//  Created by SUN on 15-7-17.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListAroundModel : NSObject

@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *been;
@property (nonatomic,strong) NSString *district;
@property (nonatomic,strong) NSString *fav;
@property (nonatomic,strong) NSString *headImg;
@property (nonatomic,strong) NSString *idd;
@property (nonatomic,strong) NSDictionary *lngLatitude;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *price;

@property (nonatomic,assign) BOOL isOtherType;



@end
