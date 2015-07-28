//
//  IndexButton.h
//  108tian
//
//  Created by SUN on 15-7-13.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexButton : UIButton

+(IndexButton *)buttonWithTitle:(NSString *)title andFrame:(CGRect)frame andImageName:(NSString *)imageName andClass:(id)classobject andSEL:(SEL)sel;

@end
