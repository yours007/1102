//
//  SettingSuggestionViewController.m
//  108tian
//
//  Created by SUN on 15-7-16.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "SettingSuggestionViewController.h"

@interface SettingSuggestionViewController ()<UITextViewDelegate>

@end

@implementation SettingSuggestionViewController
{
    UITextView *_textSusgestionView;
    UITextView *_placeHolerSusgestionView;
    
    UITextView *_textTelephoneView;
    UITextView *_placeHolerTelephoneView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadNavigationBar];
    UIView *backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, 64, 320, 480 - 64);
    backView.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.92f alpha:1.00f];
    [self.view addSubview:backView];
    
    // 意见反馈
    _placeHolerSusgestionView = [[UITextView alloc] init];
    _placeHolerSusgestionView.frame = CGRectMake(10, 74, 300, 100);
    _placeHolerSusgestionView.backgroundColor = [UIColor whiteColor];
    _placeHolerSusgestionView.text = @"留下你得宝贵意见,我们将为您做得更好!";
    _placeHolerSusgestionView.font = [UIFont systemFontOfSize:15];
    _placeHolerSusgestionView.textColor = [UIColor lightGrayColor];
    [_placeHolerSusgestionView setEditable:NO];
    [self.view addSubview:_placeHolerSusgestionView];
    
    _textSusgestionView = [[UITextView alloc] init];
    _textSusgestionView.frame = CGRectMake(10, 74, 300, 100);
    _textSusgestionView.delegate = self;
    _textSusgestionView.font = [UIFont systemFontOfSize:15];
    _textSusgestionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_textSusgestionView];
    
    
    // 电话号码
    _placeHolerTelephoneView = [[UITextView alloc] init];
    _placeHolerTelephoneView.frame = CGRectMake(10, 190, 300, 35);
    _placeHolerTelephoneView.backgroundColor = [UIColor whiteColor];
    _placeHolerTelephoneView.text = @"留下手机号,以便我们联系你";
    _placeHolerTelephoneView.font = [UIFont systemFontOfSize:15];
    _placeHolerTelephoneView.textColor = [UIColor lightGrayColor];
    [_placeHolerTelephoneView setEditable:NO];
    [self.view addSubview:_placeHolerTelephoneView];
    
    _textTelephoneView = [[UITextView alloc] init];
    _textTelephoneView.frame = CGRectMake(10, 190, 300, 35);
    _textTelephoneView.delegate = self;
    _textTelephoneView.font = [UIFont systemFontOfSize:15];
    _textTelephoneView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_textTelephoneView];
    
    
    UIButton *cancelBtn = [[UIButton alloc] init];
    cancelBtn.frame = CGRectMake(10, 190 + 35 + 15, 145, 40);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cancelBtn setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:cancelBtn];
    
    
    UIButton *submitBtn = [[UIButton alloc] init];
    submitBtn.frame = CGRectMake(10 + 155, 190 + 35 + 15, 145, 40);
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [submitBtn setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:submitBtn];

    
    
    
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if (textView == _textSusgestionView)
    {
        if (![text isEqualToString:@""])
        {
            _placeHolerSusgestionView.hidden = YES;
            _textSusgestionView.backgroundColor = [UIColor whiteColor];
        }
        if ([text isEqualToString:@""] && range.location == 0 && range.length == 1)
        {
            _placeHolerSusgestionView.hidden = NO;
            _placeHolerSusgestionView.text = @"留下你得宝贵意见,我们将为您做得更好!";
            _textSusgestionView.backgroundColor = [UIColor clearColor];
        }
        
        if ([text isEqualToString:@"\n"])
        {
            [textView resignFirstResponder];
        }
        return YES;
    }
    else
    {
        if (![text isEqualToString:@""])
        {
            _placeHolerTelephoneView.hidden = YES;
            _textTelephoneView.backgroundColor = [UIColor whiteColor];
        }
        if ([text isEqualToString:@""] && range.location == 0 && range.length == 1)
        {
            _placeHolerTelephoneView.hidden = NO;
            _placeHolerTelephoneView.text = @"留下你得宝贵意见,我们将为您做得更好!";
            _textTelephoneView.backgroundColor = [UIColor  clearColor];
        }
    
        if ([text isEqualToString:@"\n"])
        {
            [textView resignFirstResponder];
        }
        return YES;
    }

}

-(void)loadNavigationBar
{
    NSMutableDictionary *leftDict = [[NSMutableDictionary alloc] initWithObjects:@[@"nav_back_bar_image"] forKeys:@[@"itembgimagename"]];
    
    [self.myNavigationBar createMyNavigationBarWithBgImageName:@"blue_strip_img" andTitle:@"意见反馈"  andLeftItemArray:@[leftDict] andRightItemArray:nil andClass:self andSEL:@selector(navigationBarClick)];
}

-(void)navigationBarClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textSusgestionView resignFirstResponder];
    [_textTelephoneView resignFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.myNavigationBar.hidden = YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.myNavigationBar.hidden = NO;
}

@end
