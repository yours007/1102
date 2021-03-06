//
//  MyTabbar.m
//  TabbarDesign
//
//  Created by Visitor on 15/6/9.
//  Copyright (c) 2015年 Visitor. All rights reserved.
//

#import "MyTabbar.h"
#import "UIImage+Extension.h"

@implementation MyTabbar



- (void)createMyTabbarWithTabbarDict:(NSDictionary *)tabbarDict andClass:(id)classObject andSEL:(SEL)sel
{
    // 创建背景图
    [self createBgImageViewWithImageName:[tabbarDict objectForKey:@"bgImageName"]];
    
    
    // 创建item
    int index = 0;
    for(NSDictionary *itemDict in [tabbarDict objectForKey:@"Items"])
    {
        [self createItemWithItemDict:itemDict andIndex:index andCount:((NSArray *)[tabbarDict objectForKey:@"Items"]).count andClass:classObject andSEL:sel];
        index++;
    }
    
}

- (void)createBgImageViewWithImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageWithColor:[[UIColor alloc] initWithRed:1 green:1 blue:1 alpha:0.8]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = self.bounds;
    [self addSubview:imageView];
}

- (void)createItemWithItemDict:(NSDictionary *)itemDict andIndex:(int)index andCount:(int)count andClass:(id)classObject andSEL:(SEL)sel
{
    // 容器
    UIView *baseView = [[UIView alloc] init];
    baseView.frame = CGRectMake(self.frame.size.width/count*index, 0, self.frame.size.width/count, self.frame.size.height);
    baseView.tag = index;
    baseView.backgroundColor = [UIColor clearColor];
    [self addSubview:baseView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    UIImage *image = [UIImage imageNamed:[itemDict objectForKey:@"imageName"]];
    UIImage *selectImage = [UIImage imageNamed:[itemDict objectForKey:@"selectImageName"]];
    btn.frame = CGRectMake((baseView.frame.size.width-image.size.width)/2, 5, image.size.width, image.size.height);
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:selectImage forState:UIControlStateSelected];
    [btn addTarget:classObject action:sel forControlEvents:UIControlEventTouchUpInside];
    btn.tag = index;
    [baseView addSubview:btn];
    
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, btn.frame.origin.y+btn.frame.size.height, baseView.frame.size.width, baseView.frame.size.height-btn.frame.origin.y-btn.frame.size.height);
    label.text = [itemDict objectForKey:@"title"];
    label.font = [UIFont systemFontOfSize:11];
    label.textColor = [UIColor colorWithRed:0.39f green:0.39f blue:0.39f alpha:1.00f];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [baseView addSubview:label];
    
}











@end
