//
//  MySettingTableViewCell.m
//  108tian
//
//  Created by SUN on 15-7-15.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "MySettingTableViewCell.h"

@implementation MySettingTableViewCell
{
    UILabel *_label;
    UIImageView *_imageView;
    UIImageView *_imageViewLine;
}


+(instancetype)cellWithTableview:(UITableView *)tableView
{
    static NSString *setID = @"set";
    
    MySettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:setID];
    if (cell == nil)
    {
        cell = [[MySettingTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:setID];
    }
    return cell;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView];
        
        _imageViewLine = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewLine];
        
        
    }
    return self;
}

-(void)setNameStr:(NSString *)nameStr
{
    _nameStr = nameStr;
    _label.text =  _nameStr;
    _label.font = [UIFont systemFontOfSize:15];
    
    _imageView.image = [UIImage imageNamed:@"mine_setting_icon_jump"];
    
    _imageViewLine.image = [UIImage imageNamed:@"login_setting_across_line"];
}


-(void)layoutSubviews
{
    _label.frame = CGRectMake(15, 0, 320 - 15, 44);
    _imageView.frame = CGRectMake(300, 18, 8, 15);
    _imageViewLine.frame = CGRectMake(15, 43, 290, 2);
}

@end
