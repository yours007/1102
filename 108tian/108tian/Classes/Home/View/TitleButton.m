//
//  TitleButton.m
//  108tian
//
//  Created by SUN on 15-7-12.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "TitleButton.h"

@implementation TitleButton


+(TitleButton *)buttonWithClass:(id)classobject andSEL:(SEL)sel
{
    // 自定义Button
    TitleButton *tiBtn = [[TitleButton alloc] init];
    tiBtn.frame = CGRectMake(0, 0, 60, 44);
    // 又忘设字体
    tiBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    
    [tiBtn setTitle:@"北京" forState:UIControlStateNormal];
    [tiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tiBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [tiBtn setImage:[UIImage imageNamed:@"home_city_location_img"] forState:UIControlStateNormal];
    [tiBtn addTarget:classobject action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return tiBtn;
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

// 不能使用self.titleLabel 因为self.titleLabel内部会调用titleRectForContentRect
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{

    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:17]
                           };
    CGFloat titleW = 0;
    
    titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.width;
    
    CGFloat titleH = 30;
    
    CGFloat titleX = 5;
    CGFloat titleY = (contentRect.size.height - titleH)/2.0;

    
    
    return CGRectMake(titleX, titleY, titleW, titleH);
    
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 30;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = 0;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}


@end
