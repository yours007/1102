//
//  MineInteractButton.h
//  108tian
//
//  Created by SUN on 15-7-15.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineInteractButton : UIButton

+(void)buttonWithLoginBtnAndView:(UIView *)tableView andTarget:(id)target andAction:(SEL)action;

+(void)buttonWithRegisterBtnAndForgetBtnWithView:(UIView *)tableView andTarget:(id)target andAction:(SEL)action;

+(void)buttonWithsocialBtnaAndView:(UIView *)tableView andTarget:(id)target andAction:(SEL)action;

@end
