//
//  ListCollectionViewController.h
//  108tian
//
//  Created by SUN on 15-7-17.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "RootViewController.h"

@interface ListCollectionViewController : RootViewController<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic,strong) NSString *collectionUrl;

@end
