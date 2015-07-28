//
//  EventTravelModel.h
//  108tian
//
//  Created by SUN on 15-7-16.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventTravelModel : NSObject

@property (nonatomic,strong) NSString *cityEnName;
@property (nonatomic,strong) NSString *cityId;
@property (nonatomic,strong) NSString *cityName;
@property (nonatomic,strong) NSDictionary *contact;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *created;
@property (nonatomic,strong) NSString *dest;
@property (nonatomic,strong) NSString *duration;
@property (nonatomic,strong) NSString *endTime;
@property (nonatomic,strong) NSString *fav;
@property (nonatomic,strong) NSDictionary *fee;
@property (nonatomic,strong) NSString *headImg;
@property (nonatomic,strong) NSString *idd;
@property (nonatomic,strong) NSArray *lngLatitude;
@property (nonatomic,strong) NSString *merchantId;
@property (nonatomic,strong) NSString *modified;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *origin;
@property (nonatomic,strong) NSMutableArray *productArray;
@property (nonatomic,strong) NSString *startTime;
@property (nonatomic,strong) NSArray *startTimeArr;
@property (nonatomic,strong) NSArray *themes;
@property (nonatomic,strong) NSString *timeDesc;
@property (nonatomic,strong) NSString *tips;


@end
