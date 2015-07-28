//
//  MySettingTableViewCell.h
//  108tian
//
//  Created by SUN on 15-7-15.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySettingTableViewCell : UITableViewCell

@property (nonatomic,strong) NSString *nameStr;

+(instancetype)cellWithTableview:(UITableView *)tableView;

@end
