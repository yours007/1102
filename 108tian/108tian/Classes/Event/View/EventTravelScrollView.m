//
//  EventTravelScrollView.m
//  108tian
//
//  Created by SUN on 15-7-17.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "EventTravelScrollView.h"
#import "EventTravelModel.h"
#import "UIImageView+WebCache.h"
#import "EventTravelProductModel.h"
#import "UIImage+Extension.h"
#import "NSString+Tools.h"
#import "MyNavigationBar.h"

@implementation EventTravelScrollView
{
    MyNavigationBar *_myNavigationBar;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.89f green:0.89f blue:0.89f alpha:1.00f];
    }
    return self;
}


-(void)createScrollViewWithModel:(EventTravelModel *)traModel andNaVigation:(MyNavigationBar *)myNavigationBar andTarget:(id)target andAction:(SEL)action
{
    
    _myNavigationBar = myNavigationBar;
    self.contentSize = CGSizeMake(320, 50000);
    
//    EventTravelProductModel *proModel = (EventTravelProductModel *)[traModel.productArray lastObject];
    
    UIImageView *headerImageView = [[UIImageView alloc] init];
    headerImageView.frame = CGRectMake(0, 0, 320, 180);
    headerImageView.tag = 1001;
    NSString *fullHeadImgUrlStr = [PreURL stringByAppendingString:traModel.headImg];
    
    [headerImageView sd_setImageWithURL:[NSURL URLWithString:fullHeadImgUrlStr]];
    
    [self addSubview:headerImageView];
     
    // 价格
    UILabel *headingName = [[UILabel alloc] init];
    headingName.frame = CGRectMake(10, 130, 300, 20);
    headingName.text = traModel.name;
    headingName.textColor = [UIColor whiteColor];
    headingName.font = [UIFont systemFontOfSize:15];
    headingName.textAlignment = NSTextAlignmentLeft;
    [headerImageView addSubview:headingName];
    
    
    
    UIView *priceView = [[UIView alloc] init];
    priceView.frame = CGRectMake(0, 180, 320, 50);
    priceView.backgroundColor = [UIColor whiteColor];
    [self addSubview:priceView];
    
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.frame = CGRectMake(20, 0 , 50, 50);
    
    if ([[traModel.fee objectForKey:@"price"] intValue]== 0)
    {
        priceLabel.text = @"免费";
    }
    else
    {
        priceLabel.text = [NSString stringWithFormat:@"%@",[traModel.fee objectForKey:@"price"]];
    }
    priceLabel.textColor = [UIColor colorWithRed:0.95f green:0.52f blue:0.16f alpha:1.00f];
    priceLabel.font = [UIFont systemFontOfSize:20];
    
    [priceView addSubview:priceLabel];
    
    // 不支持退款
    UIImageView *PigeonImageView = [[UIImageView alloc] init];
    PigeonImageView.frame = CGRectMake(80, 20, 15, 15);
    PigeonImageView.image = [UIImage imageNamed:@"surport_refund_img"];
    [priceView addSubview:PigeonImageView];
    
    UILabel *refundLabel = [[UILabel alloc] init];
    refundLabel.frame = CGRectMake(100, 15 ,90, 25);
    refundLabel.text = @"不支持退款";
    refundLabel.textAlignment = NSTextAlignmentLeft;
    refundLabel.textColor = [UIColor colorWithRed:0.47f green:0.94f blue:0.60f alpha:1.00f];
    refundLabel.font = [UIFont systemFontOfSize:13];
    [priceView addSubview:refundLabel];
    
    // 购买
    UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    buyBtn.frame = CGRectMake(230, 8 , 80, 34);
    [buyBtn setTitle:@"购买" forState:UIControlStateNormal];
    [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buyBtn.backgroundColor = [UIColor colorWithRed:0.95f green:0.52f blue:0.16f alpha:1.00f];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    buyBtn.tag = 1;
    [buyBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [priceView addSubview:buyBtn];

    
    
    // 商家信息 180 + 50 = 230; + 150 + 20
    
    UIView *infoBackView = [[UIView alloc] init];
    infoBackView.backgroundColor = [UIColor whiteColor];
    infoBackView.frame = CGRectMake(0, 230 + 10+2, 320, 150);
    [self addSubview:infoBackView];
    
    
    UILabel *infoLabel = [[UILabel alloc] init];
    infoLabel.frame = CGRectMake(10, 0 ,320, 50);
    infoLabel.text = @"商家信息";
    infoLabel.textAlignment = NSTextAlignmentLeft;
    infoLabel.textColor = [UIColor blackColor];
    infoLabel.font = [UIFont systemFontOfSize:17];
    [infoBackView addSubview:infoLabel];
    
    UIImageView *priceLineImageView = [[UIImageView alloc] init];
    priceLineImageView.frame = CGRectMake(10, 49, 300, 2);
    priceLineImageView.image = [UIImage imageNamed:@"login_setting_across_line"];
    [infoBackView addSubview:priceLineImageView];
    
    
    UILabel *footLabel = [[UILabel alloc] init];
    footLabel.frame = CGRectMake(10, 50 ,320, 50);
    
    footLabel.text = [traModel.contact objectForKey:@"name"];
    footLabel.textAlignment = NSTextAlignmentLeft;
    footLabel.textColor = [UIColor blackColor];
    footLabel.font = [UIFont systemFontOfSize:14];
    [infoBackView addSubview:footLabel];
    
    UIImageView *footLineImageView = [[UIImageView alloc] init];
    footLineImageView.frame = CGRectMake(10, 98, 300, 2);
    footLineImageView.image = [UIImage imageNamed:@"login_setting_across_line"];
    [infoBackView addSubview:footLineImageView];
    
    
    UIImageView *loctionImageView = [[UIImageView alloc] init];
    loctionImageView.frame = CGRectMake(10, 120, 10, 14);
    loctionImageView.image = [UIImage imageNamed:@"location_icon_blue_small"];
    [infoBackView addSubview:loctionImageView];
    
    UILabel *destLabel = [[UILabel alloc] init];
    destLabel.frame = CGRectMake(30, 100 ,210, 50);
    destLabel.text = traModel.dest;
    destLabel.textAlignment = NSTextAlignmentLeft;
    destLabel.textColor = [UIColor blackColor];
    destLabel.font = [UIFont systemFontOfSize:13];
    destLabel.numberOfLines = 0;
    [infoBackView addSubview:destLabel];
    
    
    UIButton *telephoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    telephoneBtn.frame = CGRectMake(260, 105 , 40, 40);
    
    [telephoneBtn setImage:[UIImage imageNamed:@"mine_setting_icon_tel@2x"] forState:UIControlStateNormal];
    [telephoneBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    telephoneBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    telephoneBtn.tag = 2;
    
    [telephoneBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [infoBackView addSubview:telephoneBtn];
    
    
    UIImageView *partLineImageView = [[UIImageView alloc] init];
    partLineImageView.frame = CGRectMake(240, 100, 2, 50);
    partLineImageView.image = [UIImage imageWithColor:[UIColor colorWithRed:0.84f green:0.84f blue:0.84f alpha:1.00f]];
    [infoBackView addSubview:partLineImageView];
    
    
    // 活动信息 230 + 150 = 380 + 20 = 400;
    UIView *sportBackView = [[UIView alloc] init];
    sportBackView.backgroundColor = [UIColor whiteColor];
    sportBackView.frame = CGRectMake(0, 400 + 4 , 320, 260);
    [self addSubview:sportBackView];
    
    
    UILabel *sportLabel = [[UILabel alloc] init];
    sportLabel.frame = CGRectMake(10, 0 ,320, 50);
    sportLabel.text = @"活动信息";
    sportLabel.textAlignment = NSTextAlignmentLeft;
    sportLabel.textColor = [UIColor blackColor];
    sportLabel.font = [UIFont boldSystemFontOfSize:15];
    [sportBackView addSubview:sportLabel];
    
    UIImageView *sportLineImageView = [[UIImageView alloc] init];
    sportLineImageView.frame = CGRectMake(10, 49, 300, 2);
    sportLineImageView.image = [UIImage imageNamed:@"login_setting_across_line"];
    [sportBackView addSubview:sportLineImageView];
    
    UILabel *timeInfoLabel = [[UILabel alloc] init];
    timeInfoLabel.frame = CGRectMake(10, 50 ,320, 40);
    timeInfoLabel.text = [NSString stringWithFormat:@"活动时间:  %@天",traModel.duration];
    timeInfoLabel.textAlignment = NSTextAlignmentLeft;
    timeInfoLabel.textColor = [UIColor blackColor];
    timeInfoLabel.font = [UIFont systemFontOfSize:14];
    [sportBackView addSubview:timeInfoLabel];
    
    UILabel *siteInfoLabel = [[UILabel alloc] init];
    siteInfoLabel.frame = CGRectMake(10, 90 ,320, 40);
    siteInfoLabel.text = [NSString stringWithFormat:@"活动地点:  %@",traModel.dest];
    siteInfoLabel.textAlignment = NSTextAlignmentLeft;
    siteInfoLabel.textColor = [UIColor blackColor];
    siteInfoLabel.font = [UIFont systemFontOfSize:14];
    [sportBackView addSubview:siteInfoLabel];
    
    
    UILabel *typeInfoLabel = [[UILabel alloc] init];
    typeInfoLabel.frame = CGRectMake(10, 130 ,320, 40);
    typeInfoLabel.text = [NSString stringWithFormat:@"活动类型:  %@",[traModel.themes lastObject]];
    typeInfoLabel.textAlignment = NSTextAlignmentLeft;
    typeInfoLabel.textColor = [UIColor blackColor];
    typeInfoLabel.font = [UIFont systemFontOfSize:14];
    [sportBackView addSubview:typeInfoLabel];
    
    UILabel *gatherInfoLabel = [[UILabel alloc] init];
    gatherInfoLabel.frame = CGRectMake(10, 170 ,320, 40);
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MM月dd日 hh:mm"];
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:([traModel.modified doubleValue]/ 1000)];
    
    gatherInfoLabel.text = [NSString stringWithFormat:@"集合时间:  %@",[format stringFromDate:date]];
    gatherInfoLabel.textAlignment = NSTextAlignmentLeft;
    gatherInfoLabel.textColor = [UIColor blackColor];
    gatherInfoLabel.font = [UIFont systemFontOfSize:14];
    [sportBackView addSubview:gatherInfoLabel];
    
    UILabel *locationInfoLabel = [[UILabel alloc] init];
    locationInfoLabel.frame = CGRectMake(10, 210 ,300, 40);
    locationInfoLabel.text = [NSString stringWithFormat:@"集合地点:  %@",traModel.origin];
    locationInfoLabel.textAlignment = NSTextAlignmentLeft;
    locationInfoLabel.textColor = [UIColor blackColor];
    locationInfoLabel.font = [UIFont systemFontOfSize:14];
    locationInfoLabel.numberOfLines = 0;
    [sportBackView addSubview:locationInfoLabel];
    
    // 出行须知 675 + 410(待定)
    UIView *noticeBackView = [[UIView alloc] init];
    noticeBackView.backgroundColor = [UIColor whiteColor];
    noticeBackView.frame = CGRectMake(0, 675, 320, 700);
    [self addSubview:noticeBackView];
    // 675 + 50
    UILabel *noticeLabel = [[UILabel alloc] init];
    noticeLabel.frame = CGRectMake(10, 0 ,300, 50);
    noticeLabel.text = @"出行须知";
    noticeLabel.textAlignment = NSTextAlignmentLeft;
    noticeLabel.textColor = [UIColor blackColor];
    noticeLabel.font = [UIFont systemFontOfSize:17];
    [noticeBackView addSubview:noticeLabel];
    // 675 + 50;
    UIImageView *noticeLineImageView = [[UIImageView alloc] init];
    noticeLineImageView.frame = CGRectMake(10, 48, 300, 2);
    noticeLineImageView.image = [UIImage imageNamed:@"login_setting_across_line"];
    [noticeBackView addSubview:noticeLineImageView];
    // 725 + 30
    UILabel *payingLabel = [[UILabel alloc] init];
    payingLabel.frame = CGRectMake(10, 50 ,300, 30);
    payingLabel.text = @"付费方式:";
    payingLabel.textAlignment = NSTextAlignmentLeft;
    payingLabel.textColor = [UIColor blackColor];
    payingLabel.font = [UIFont systemFontOfSize:14];
    [noticeBackView addSubview:payingLabel];
    // 755 + 40
    UILabel *payingResultLabel = [[UILabel alloc] init];
    payingResultLabel.frame = CGRectMake(10, 80 ,300, 40);
    payingResultLabel.text = [NSString stringWithFormat:@"%@",[traModel.fee objectForKey:@"mode"]];
    payingResultLabel.numberOfLines = 0;
    payingResultLabel.textAlignment = NSTextAlignmentLeft;
    payingResultLabel.textColor = [UIColor blackColor];
    payingResultLabel.font = [UIFont systemFontOfSize:14];
    [noticeBackView addSubview:payingResultLabel];
    // 795 + 40
    UILabel *payingInfoLabel = [[UILabel alloc] init];
    payingInfoLabel.frame = CGRectMake(10, 120 ,300, 40);
    payingInfoLabel.text = @"费用详情:";
    payingInfoLabel.textAlignment = NSTextAlignmentLeft;
    payingInfoLabel.textColor = [UIColor blackColor];
    payingInfoLabel.font = [UIFont systemFontOfSize:14];
    [noticeBackView addSubview:payingInfoLabel];
    // 费用详情label
    UILabel *payingInfoResultLabel = [[UILabel alloc] init];
    
    payingInfoResultLabel.textAlignment = NSTextAlignmentLeft;
    payingInfoResultLabel.textColor = [UIColor blackColor];
    payingInfoResultLabel.font = [UIFont systemFontOfSize:14];
    
    
    
    NSString *payingInfoResultLabelTextStr = [NSString stringWithFormat:@"%@",[traModel.fee objectForKey:@"detail"]];
    CGSize payingInfoResultLabelTextSize = [payingInfoResultLabelTextStr textRectWithsizeOfFont:14];
    
    payingInfoResultLabel.frame = CGRectMake(10, 160, 300, payingInfoResultLabelTextSize.height);
    payingInfoResultLabel.numberOfLines = 0;
    payingInfoResultLabel.text = payingInfoResultLabelTextStr;
    
    [noticeBackView addSubview:payingInfoResultLabel];
    
    
    UILabel *tipsLabel = [[UILabel alloc] init];
    tipsLabel.frame = CGRectMake(10, CGRectGetMaxY(payingInfoResultLabel.frame) ,300, 50);
    tipsLabel.text = @"出行提示:";
    tipsLabel.textAlignment = NSTextAlignmentLeft;
    tipsLabel.textColor = [UIColor blackColor];
    tipsLabel.font = [UIFont systemFontOfSize:14];
    [noticeBackView addSubview:tipsLabel];
    
    
    UILabel *tipInfoLabel = [[UILabel alloc] init];
    
    tipInfoLabel.textAlignment = NSTextAlignmentLeft;
    tipInfoLabel.textColor = [UIColor blackColor];
    tipInfoLabel.font = [UIFont systemFontOfSize:14];
    
    CGFloat height = [NSString textRectWithTextStr:traModel.tips NumOfFont:14];
    
    tipInfoLabel.frame = CGRectMake(10, CGRectGetMaxY(tipsLabel.frame), 300, height);
    tipInfoLabel.numberOfLines = 0;
    tipInfoLabel.text = traModel.tips;
    [noticeBackView addSubview:tipInfoLabel];
    
    CGFloat frameY1 = CGRectGetMaxY(sportBackView.frame);
    CGFloat frameY2 = CGRectGetMaxY(tipInfoLabel.frame);
    noticeBackView.frame = CGRectMake(0, frameY1 + 15 , 320, frameY2 + 40);
    
    
    self.contentSize = CGSizeMake(320, CGRectGetMaxY(noticeBackView.frame));
    
    
//    UIView *detailBackView = [[UIView alloc] init];
//    detailBackView.backgroundColor = [UIColor whiteColor];
//    detailBackView.frame = CGRectMake(0, CGRectGetMaxY(noticeBackView.frame) + 15, 320, 50);
//    [self  addSubview:detailBackView];
//    
    
//    UILabel *detailLabel = [[UILabel alloc] init];
//    detailLabel.frame = CGRectMake(10, 0 ,300, 50);
//    detailLabel.text = @"详情介绍:";
//    detailLabel.textAlignment = NSTextAlignmentLeft;
//    detailLabel.textColor = [UIColor blackColor];
//    detailLabel.font = [UIFont systemFontOfSize:17];
//    [detailBackView addSubview:detailLabel];
//    
//    UIImageView *detailLineImageView = [[UIImageView alloc] init];
//    noticeLineImageView.frame = CGRectMake(10, 48, 300, 2);
//    noticeLineImageView.image = [UIImage imageNamed:@"login_setting_across_line"];
//    [detailBackView addSubview:detailLineImageView];
//    

    
//    NSString *contentStr = traModel.content;
//    
//    UIWebView *webView = [[UIWebView alloc] init];
//    
//    
//    webView.frame = CGRectMake(0, CGRectGetMaxY(detailBackView.frame),320,10000);
//    
//    
//    
//    [webView loadHTMLString:contentStr baseURL:nil];
////    [webView sizeToFit];
//    [self addSubview:webView];
//
////    [webView stringByEvaluatingJavaScriptFromString:@"document.body.style.zoom=0.5"];
////    
////    [webView setScalesPageToFit:YES];
}





@end
