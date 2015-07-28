//
//  HeaderView.h
//  108tian
//
//  Created by SUN on 15-7-14.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView

-(void)createHeaderViewWithTarget:(id)target andAction:(SEL)action;

-(void)createCrowdButtonWithTarget:(id)target andAction:(SEL)action;
-(void)createSelectionView;

@end
