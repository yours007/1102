//
//  ListColTableViewCell.m
//  108tian
//
//  Created by SUN on 15-7-17.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "ListColTableViewCell.h"
#import "ListSubCollectionFrameModel.h"
#import "UIImageView+WebCache.h"
#import "ListSubCollectionModel.h"
@implementation ListColTableViewCell
{
    UIImageView *_iconImageView;
    UIImageView *_favImageView;
    
    UILabel *_namaLabel;
    UILabel *_detailLabel;
    
    UIView *_backView;
    UIImageView *_nameIconImageView;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _backView = [[UIView alloc] init];
        [self.contentView addSubview:_backView];
        
        _iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImageView];
        
        _favImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_favImageView];
        
        _namaLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_namaLabel];
        
        _detailLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_detailLabel];
        
        _nameIconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_nameIconImageView];
        
        self.backgroundColor = [UIColor colorWithRed:0.84f green:0.84f blue:0.84f alpha:1.00f];

    }
    return self;
}




-(void)setFrameModel:(ListSubCollectionFrameModel *)frameModel
{
    _frameModel = frameModel;
    _iconImageView.frame = frameModel.iconF;
    
    
    NSString *fullImageStr = [PreURL stringByAppendingString:frameModel.liModel.img];
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:fullImageStr]];
    _favImageView.image = [UIImage imageNamed:@"building"];
    
    
    _namaLabel.text = frameModel.liModel.name;
    _namaLabel.font = [UIFont systemFontOfSize:15];
    _namaLabel.numberOfLines = 0;
    
    
    _detailLabel.text = frameModel.liModel.desc;
    _detailLabel.font = [UIFont systemFontOfSize:13];
    _detailLabel.numberOfLines = 0;
    
    
    _backView.backgroundColor = [UIColor whiteColor];
    
    _nameIconImageView.image = [UIImage imageNamed:@"choiceness_detail_flag_img"];
    
}


-(void)layoutSubviews
{
    _favImageView.frame = self.frameModel.favF;
    _namaLabel.frame =self.frameModel.nameF;
    _detailLabel.frame = self.frameModel.detailF;
    _backView.frame = self.frameModel.viewF;
    _nameIconImageView.frame = self.frameModel.nameIconF;

}



@end
