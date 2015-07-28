//
//  ListCollectionModel.h
//  108tian
//
//  Created by SUN on 15-7-17.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListCollectionModel : NSObject

@property (nonatomic,strong) NSString *cityEnName;
@property (nonatomic,strong) NSString *cityId;
@property (nonatomic,strong) NSString *cityName;
@property (nonatomic,strong) NSString *fav;
@property (nonatomic,strong) NSString *headImg;
@property (nonatomic,strong) NSString *idd;
@property (nonatomic,strong) NSArray *imgs;
@property (nonatomic,strong) NSString *isTop;
@property (nonatomic,strong) NSMutableArray *itemsArray;
@property (nonatomic,strong) NSString *modified;
@property (nonatomic,strong) NSString *month;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *sname;
@property (nonatomic,strong) NSString *subtitle;
@property (nonatomic,strong) NSString *type;

@end
