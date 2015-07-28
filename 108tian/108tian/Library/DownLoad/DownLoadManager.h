//
//  DownLoadManager.h
//  UITableView-4
//
//  Created by Visitor on 15/6/10.
//  Copyright (c) 2015年 Visitor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownLoad.h"

@interface DownLoadManager : NSObject<DownLoadDelegate>
/**
 *  单例类返回一个下载管理对象
 */
+ (DownLoadManager *)sharedDownLoadManager;
/**
 *  下载管理函数的下载数据接口
 *
 *  @param downLoadStr  下载的地址
 *  @param page         下载的页数
 *  @param downLoadType 下载的类型
 *  @param isRefresh    是否是刷新
 */

- (void)addDownLoadWithDownLoadStr:(NSString *)downLoadStr andPage:(int)page andDownLoadType:(int)downLoadType andIsRefresh:(BOOL)isRefresh;
/**
 *  从缓存中取数据,返回一个数组
 *
 *  @param downLoadStr 取数据的key
 *
 *  @return 返回一个数组
 */
- (NSMutableArray *)getDataWithDownLoadStr:(NSString *)downLoadStr;

@end















