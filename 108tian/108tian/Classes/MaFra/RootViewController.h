//
//  RootViewController.h
//  108tian
//
//  Created by SUN on 15-7-12.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNavigationBar.h"
@interface RootViewController : UIViewController

@property (nonatomic,strong) NSString *vcTitle;
@property (nonatomic,strong) NSString *vcURLString;


@property (nonatomic,strong) MyNavigationBar *myNavigationBar;

@end
