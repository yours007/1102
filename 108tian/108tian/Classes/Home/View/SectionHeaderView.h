//
//  SectionHeaderView.h
//  108tian
//
//  Created by SUN on 15-7-13.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionHeaderView : UIView


+(UIView *)headerViewWithSection:(NSInteger)section andArray:(NSArray *)dataArray;

+(UIView *)viewWithNothingCreateBlankView;

@end
