//
//  EventTravelScrollView.h
//  108tian
//
//  Created by SUN on 15-7-17.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EventTravelModel;
@class MyNavigationBar;

@interface EventTravelScrollView : UIScrollView

-(void)createScrollViewWithModel:(EventTravelModel *)traModel andNaVigation:(MyNavigationBar *)myNavigationBar andTarget:(id)target andAction:(SEL)action;

@end
