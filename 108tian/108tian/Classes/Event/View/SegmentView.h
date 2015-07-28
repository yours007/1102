//
//  SegmentView.h
//  108tian
//
//  Created by SUN on 15-7-14.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentView : UIView

+(SegmentView *)viewWithTarget:(id)target andAction:(SEL)action;
+(SegmentView *)createBlankView;
+(SegmentView *)createSectionViewToSetting;

@end
