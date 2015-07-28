//
//  SortButton.m
//  108tian
//
//  Created by SUN on 15-7-14.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "SortButton.h"

@implementation SortButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}


+(SortButton *)buttonWithTitle:(NSString *)title andFrame:(CGRect)frame andImageName:(NSString *)imageName andClass:(id)classobject andSEL:(SEL)sel
{
    // 自定义Button
    SortButton *sBtn = [[SortButton alloc] init];
    sBtn.frame = frame;
    sBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [sBtn setTitle:title forState:UIControlStateNormal];
    [sBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [sBtn addTarget:classobject action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return sBtn;
}

//-(void)setHighlighted:(BOOL)highlighted
//{
//    // 取消高亮
//}


-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 70;
    CGFloat imageH = 70;
    CGFloat imageX = (contentRect.size.width - imageW) / 2.0;
    CGFloat imageY = 0;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:14]
                           };
    CGFloat titleW = 0;
    
    titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.width;
    
    CGFloat titleH = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.height;
    
    CGFloat titleX = (contentRect.size.width - titleW) / 2.0 + 4;
    CGFloat titleY = contentRect.size.height - titleH - 10;

    
    return CGRectMake(titleX, titleY, titleW, titleH);
    
}




@end
