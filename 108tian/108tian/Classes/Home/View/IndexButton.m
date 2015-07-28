//
//  IndexButton.m
//  108tian
//
//  Created by SUN on 15-7-13.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "IndexButton.h"

@implementation IndexButton


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}


+(IndexButton *)buttonWithTitle:(NSString *)title andFrame:(CGRect)frame andImageName:(NSString *)imageName andClass:(id)classobject andSEL:(SEL)sel
{
    // 自定义Button
    IndexButton *inBtn = [[IndexButton alloc] init];
    inBtn.frame = frame;
    inBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [inBtn setTitle:title forState:UIControlStateNormal];
    [inBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [inBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [inBtn addTarget:classobject action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return inBtn;
}

//-(void)setHighlighted:(BOOL)highlighted
//{
//    // 取消高亮
//}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:14]
                           };
    CGFloat titleW = 0;
    
    titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.width;
    
    CGFloat titleH = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.height;
    
    CGFloat titleX = (contentRect.size.width - titleW) / 2.0;
    CGFloat titleY = 55;
    

    return CGRectMake(titleX, titleY, titleW, titleH);
    
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 60;
    CGFloat imageH = 60;
    CGFloat imageX = (contentRect.size.width - imageW) / 2.0;
    CGFloat imageY = 0;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}


@end
