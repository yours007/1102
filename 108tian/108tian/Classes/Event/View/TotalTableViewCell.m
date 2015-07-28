//
//  TotalTableViewCell.m
//  108tian
//
//  Created by SUN on 15-7-14.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "TotalTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "TotalModel.h"

@implementation TotalTableViewCell
{
    UIImageView *_imageView;
    UILabel *_nameLabel;
    UILabel *_timeLabel;
    UILabel *_priceLabel;
    UILabel *_distanceLabel;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView];
        
        _nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];

        _timeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLabel];
    
        _priceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_priceLabel];
        
        _distanceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_distanceLabel];
    }
    return self;
}



-(void)setTotModel:(TotalModel *)totModel
{
    NSString *fullStr = [PreURL stringByAppendingString:totModel.headImg];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:fullStr]];
    
    
    _nameLabel.text = totModel.name;
    _nameLabel.font = [UIFont systemFontOfSize:14];
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:([totModel.startTime doubleValue]/ 1000)];

    _timeLabel.text = [formatter stringFromDate:date];
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.font = [UIFont systemFontOfSize:14];
    
    
    _priceLabel.text = nil;
    _priceLabel.font = [UIFont systemFontOfSize:14];
    [totModel.price intValue] ? (_priceLabel.text = [NSString stringWithFormat:@"%@",totModel.price]) : (_priceLabel.text = @"免费");
    
    
    _distanceLabel.font = [UIFont systemFontOfSize:14];
    _distanceLabel.textColor =[UIColor grayColor];
    _distanceLabel.text = @"16.9千米";

}


-(void)layoutSubviews
{
    _imageView.frame = CGRectMake(0, 0, 320, 160);
    _nameLabel.frame = CGRectMake(10, 170, 220, 20);
    _timeLabel.frame = CGRectMake(10, 195, 220, 20);
    _priceLabel.frame = CGRectMake(280, 170, 40, 20);
    _distanceLabel.frame = CGRectMake(260, 195, 60, 20);

    
}


@end
