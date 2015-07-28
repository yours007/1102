//
//  MyTableViewCell.m
//  108tian
//
//  Created by SUN on 15-7-13.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "MyTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ItemsModel.h"
#import "FavorButton.h"


@interface MyTableViewCell ()


@end

@implementation MyTableViewCell
{
    UIImageView *_imageView;
    UILabel *_label;
    UILabel *_subLabel;
    FavorButton *_faBtn;
    UIView *_view;
}

+(instancetype )cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView];
        
        _view = [[UIView alloc] init];
        [self.contentView addSubview:_view];
        
        _label = [[UILabel alloc] init];
        _label.frame = CGRectMake(30, 90, 250, 20);
        [self.contentView addSubview:_label];
        
        _subLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_subLabel];
        
        _faBtn = [[FavorButton alloc] init];
        [self.contentView addSubview:_faBtn];

    }
    return self;
}


-(void)setItemModel:(ItemsModel *)itemModel
{
    _itemModel = itemModel;
    NSString *urlStr = [PreURL stringByAppendingString:itemModel.img];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
    _imageView.layer.cornerRadius = 4;
    _imageView.layer.masksToBounds = YES;
    
    _label.text = itemModel.name;
    _label.font = [UIFont boldSystemFontOfSize:14];
    _label.textColor = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
    
    _subLabel.text = itemModel.label;
    _subLabel.textColor = [UIColor whiteColor];
    _subLabel.font = [UIFont boldSystemFontOfSize:11];
    
    [_faBtn setImage:[UIImage imageNamed:@"white_fav_image"] forState:UIControlStateNormal];
    [_faBtn setImage:[UIImage imageNamed:@"red_fav_image"] forState:UIControlStateSelected];
    _faBtn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    [_faBtn setTitle:[NSString stringWithFormat:@"%@",itemModel.fav] forState:UIControlStateNormal];
    
    _view.layer.cornerRadius = 2;
    _view.backgroundColor = [UIColor colorWithRed:0.33f green:0.77f blue:0.69f alpha:1.00f];
    
}


-(void)layoutSubviews
{
    _imageView.frame = CGRectMake(10, 0, 300, 140);
    
    _subLabel.frame = CGRectMake(30, 110, 250, 15);
    _faBtn.frame = CGRectMake(260, 90, 40, 40);
    _view.frame = CGRectMake(22, 93,4, 34);
}


@end
