//
//  ListAroundTableViewCell.m
//  108tian
//
//  Created by SUN on 15-7-17.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "ListAroundTableViewCell.h"
#import "ListAroundModel.h"
#import "UIImageView+WebCache.h"

@implementation ListAroundTableViewCell
{
    UIImageView *_imageView;
    UILabel *_nameLabel;
    UILabel *_locationLabel;
    UILabel *_priceLabel;
    UILabel *_princeIndoLabel;
    UIView *_backView;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _backView = [[UIView alloc] init];
        [self.contentView addSubview:_backView];
        
        
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView];
        
        _nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
        
        _locationLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_locationLabel];
        
        _priceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_priceLabel];
        
        _princeIndoLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_princeIndoLabel];
        
       
        
        self.backgroundColor = [UIColor colorWithRed:0.84f green:0.84f blue:0.84f alpha:1.00f];
        
        
    }
    return self;
}

-(void)setAroModel:(ListAroundModel *)aroModel
{
    
    _aroModel = aroModel;
    
    NSString *fullStr = [PreURL stringByAppendingString:aroModel.headImg];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:fullStr]];
    
    _nameLabel.text = aroModel.name;
    _nameLabel.font = [UIFont systemFontOfSize:14];
    
    _locationLabel.text = _aroModel.district;
    _locationLabel.textColor = [UIColor grayColor];
    _locationLabel.font = [UIFont systemFontOfSize:14];
    
    if (!aroModel.isOtherType)
    {
        _priceLabel.text = @"价格";
        _priceLabel.font = [UIFont systemFontOfSize:14];
        _priceLabel.textColor = [UIColor blackColor];
        
        _princeIndoLabel.font = [UIFont systemFontOfSize:14];
        _princeIndoLabel.text = [NSString stringWithFormat:@"%@",aroModel.price];
        _princeIndoLabel.textColor =[UIColor orangeColor];
    }
    
    _backView.backgroundColor = [UIColor whiteColor];

}

-(void)layoutSubviews
{
    _imageView.frame = CGRectMake(0, 0, 320, 160);
    _nameLabel.frame = CGRectMake(10, 170, 220, 20);
    _locationLabel.frame = CGRectMake(10, 195, 220, 20);
    _priceLabel.frame = CGRectMake(260, 170, 60, 20);
    _princeIndoLabel.frame = CGRectMake(260, 195, 60, 20);
    _backView.frame = CGRectMake(0, 160, 320, 70);
    
}


@end
