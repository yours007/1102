//
//  DownLoad.h
//  UITableView-4
//
//  Created by Visitor on 15/6/10.
//  Copyright (c) 2015年 Visitor. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DownLoad;

@protocol DownLoadDelegate <NSObject>
- (void)downLoadFinishWithDownLoad:(DownLoad *)downLoad;
@end


@interface DownLoad : NSObject<NSURLConnectionDataDelegate>
/**
 *  下载地址
 */
@property(nonatomic,strong)NSString *downLoadStr;

/**
 *  页号 int
 */
@property(nonatomic)int downLoadPage;
/**
 *  类型 int
 */
@property(nonatomic)int downLoadType;
/**
 *  下载的数据 NSMutableData
 */
@property(nonatomic,strong)NSMutableData *downLoadData;
@property(nonatomic,weak)__weak id<DownLoadDelegate> delegate;
- (void)downLoad;








@end
