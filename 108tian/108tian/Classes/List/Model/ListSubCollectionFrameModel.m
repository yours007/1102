//
//  ListSubCollectionFrameModel.m
//  108tian
//
//  Created by SUN on 15-7-17.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "ListSubCollectionFrameModel.h"
#import "ListSubCollectionModel.h"
#import "ListCollectionModel.h"
#import "NSString+Tools.h"

@implementation ListSubCollectionFrameModel

-(void)setLiModel:(ListSubCollectionModel *)liModel
{
    _liModel = liModel;
    
    
    CGFloat padding = 5;
    
    
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 320 - 2 *padding;
    CGFloat iconH = 200;
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    
    CGFloat favX = 260;
    CGFloat favY = 20+10;
    CGFloat favW = 40;
    CGFloat favH = 40;
    _favF = CGRectMake(favX, favY, favW, favH);
    

    
    CGFloat nameX = padding + 16;;
    CGFloat nameY = 200 + 20 ;
    CGFloat nameW = 320 - 2*padding - 20;
    CGFloat nameH = [liModel.name textRectWithNumOfFont:15];
    _nameF = CGRectMake(nameX, nameY, nameW, nameH);
    
    
    CGFloat nameIconX = padding+ 5;
    CGFloat nameIconY = 200 + 16;
    CGFloat nameIconW = 10;
    CGFloat nameUcinH = 20;
    _nameIconF = CGRectMake(nameIconX, nameIconY, nameIconW, nameUcinH);
    
    CGFloat detailX = padding * 2;
    CGFloat detailY = CGRectGetMaxY(_nameF) + 15;
    CGFloat detailW = 300 - 2*padding - 10;
    CGFloat detailH = [liModel.desc textRectWithNumOfFont:14];
    _detailF = CGRectMake(detailX, detailY, detailW, detailH);
    
     
    CGFloat viewX = 0;
    CGFloat viewY = 0;
    CGFloat viewW = 320;
    CGFloat viewH = CGRectGetMaxY(_detailF) + 5+ 10;
    _viewF = CGRectMake(viewX, viewY, viewW, viewH);
    
    _Height = CGRectGetMaxY(_detailF) + 10 + 5 + 5;
    
}


@end
