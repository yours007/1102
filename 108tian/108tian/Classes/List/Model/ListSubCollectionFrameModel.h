//
//  ListSubCollectionFrameModel.h
//  108tian
//
//  Created by SUN on 15-7-17.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListSubCollectionModel;

@interface ListSubCollectionFrameModel : NSObject

@property (nonatomic,assign) CGRect iconF;
@property (nonatomic,assign) CGRect favF;
@property (nonatomic,assign) CGRect nameF;
@property (nonatomic,assign) CGRect detailF;
@property (nonatomic,assign) CGRect viewF;
@property (nonatomic,assign) CGRect nameIconF;

@property (nonatomic,assign) CGFloat Height;

@property (nonatomic,strong) ListSubCollectionModel *liModel;

@end
