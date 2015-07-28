//
//  MyCollectionViewCell.m
//  108tian
//
//  Created by SUN on 15-7-14.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "DetailModel.h"
#import "UIImageView+WebCache.h"

@implementation MyCollectionViewCell
{
    UIImageView *_imageView;
    UILabel *_label;
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView];
        
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
    }
    return self;
}


-(void)setDeModel:(DetailModel *)deModel
{
    _deModel = deModel;
    NSString *fullURL = [PreURL stringByAppendingString:deModel.headImg];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:fullURL]];
    _imageView.layer.cornerRadius = 5;
    _imageView.layer.masksToBounds = YES;
    
    _label.text = deModel.name;
    _label.font = [UIFont systemFontOfSize:14];
    _label.textColor = [UIColor whiteColor];
    _label.backgroundColor = [UIColor clearColor];
    _label.numberOfLines = 0;
    _label.lineBreakMode = NSLineBreakByWordWrapping;
    _label.textAlignment = NSTextAlignmentCenter;
}


-(void)layoutSubviews
{
    _imageView.frame = self.bounds;
    
    _label.frame = CGRectMake(20, 90, 100, 50);
    
}

@end
