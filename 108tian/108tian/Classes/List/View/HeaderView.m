//
//  HeaderView.m
//  108tian
//
//  Created by SUN on 15-7-14.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "HeaderView.h"
#import "SortButton.h"
#import "CrowdButton.h"

@implementation HeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
       self.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.92f alpha:1.00f];
    }
    return self;
}

-(void)createHeaderViewWithTarget:(id)target andAction:(SEL)action
{
    
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0 , 320 , 20);
    view.backgroundColor = [UIColor whiteColor];
    [self addSubview:view];
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor whiteColor];
    label.frame = CGRectMake(20, 0, 60, 20);
    label.text = @"玩法分类";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:13];
    [view addSubview:label];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(10, 3, 5, 15);
    imageView.image = [UIImage imageNamed:@"choiceness_image_view_flag"];
    [view addSubview:imageView];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SortButton.plist" ofType:nil]];
    [self createButtonWithArray:array andTarget:target andAction:action];
}

-(void)createButtonWithArray:(NSArray *)array andTarget:(id)target andAction:(SEL)action
{
    for (int i = 0; i < array.count;i ++)
    {
        NSDictionary *dict = [array objectAtIndex:i];
        
        SortButton *sbtn = [SortButton buttonWithTitle:[dict objectForKey:@"title"] andFrame:CGRectMake( 320 / 4 * i , 20 , 320 / 4 , 85) andImageName:[dict objectForKey:@"imagename"] andClass:nil andSEL:nil];
        sbtn.backgroundColor = [UIColor whiteColor];
        sbtn.tag = i;
        [sbtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sbtn];
    }
}


-(void)createCrowdButtonWithTarget:(id)target andAction:(SEL)action
{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 112, 320, 110);
    view.backgroundColor = [UIColor whiteColor];
    [self addSubview:view];
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor whiteColor];
    label.frame = CGRectMake(20, 10, 60, 20);
    label.text = @"人群分类";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:13];
    [view addSubview:label];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(10, 13, 5, 15);
    imageView.image = [UIImage imageNamed:@"choiceness_image_view_flag"];
    [view addSubview:imageView];
    

    NSArray *imageArray = [[NSArray alloc] initWithObjects:@"choiceness_paternity_btn_img",@"choiceness_lovers_btn_img",@"choiceness_team_btn_img",nil];
    NSArray *titleArray = @[@"亲子",@"情侣",@"团队"];
    
    for (int  i = 0; i < 3; i ++)
    {
        CGFloat padding = 5;
        CGFloat btnW = (320 - 20) / 3.0;
        CGFloat btnH = 60;
        CGFloat btnX = padding + (padding +btnW) *i;
        CGFloat btnY = 150;
       
        CrowdButton *btn = [[CrowdButton alloc] init];
        NSString *imageName = [imageArray objectAtIndex:i];
        NSString *titleName = [titleArray objectAtIndex:i];
        btn.frame = CGRectMake(btnX,btnY, btnW, btnH);
        
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        btn.tag = i;
        btn.layer.borderWidth = 1;
        btn.layer.borderColor =[UIColor colorWithRed:0.90f green:0.90f blue:0.90f alpha:1.00f].CGColor;
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitle:titleName forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

-(void)createSelectionView
{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 230, 320, 40);
    view.backgroundColor = [UIColor whiteColor];
    [self addSubview:view];
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor whiteColor];
    label.frame = CGRectMake(20, 10, 60, 20);
    label.text = @"精选";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14];
    [view addSubview:label];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(10, 13, 5, 15);
    imageView.image = [UIImage imageNamed:@"choiceness_image_view_flag"];
    [view addSubview:imageView];
}


@end
