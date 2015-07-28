//
//  DownLoadManager.m
//  UITableView-4
//
//  Created by Visitor on 15/6/10.
//  Copyright (c) 2015年 Visitor. All rights reserved.
//

#import "DownLoadManager.h"
#import "HomeModel.h"
#import "ItemsModel.h"
#import "ListModel.h"
#import "BannerModel.h"
#import "indexWhatModel.h"
#import "DetailModel.h"
#import "ListModels.h"
#import "classifyModel.h"
#import "TotalModel.h"
#import "EventTravelModel.h"
#import "EventTravelProductModel.h"
#import "ListSubCollectionModel.h"
#import "ListCollectionModel.h"
#import "ListSubCollectionFrameModel.h"
#import "ListAroundModel.h"
#import "ContentModel.h"
#import "HomeFaModel.h"
@implementation DownLoadManager
{
    NSMutableDictionary *_taskDict;
    NSMutableDictionary *_sourceDict;
}
static DownLoadManager *_sharedDownLoadManager;
/**
 *  单例类返回一个下载管理对象
 *
 *  @return
 */
+ (DownLoadManager *)sharedDownLoadManager
{
    if(!_sharedDownLoadManager)
    {
        _sharedDownLoadManager = [[DownLoadManager alloc] init];
    }
    return _sharedDownLoadManager;
}

/**
 *  整个程序只需要一个_sourceDict(数据缓存)和_taskDict(任务缓存)
 *
 *  @return 实例化好的管理函数对象
 */
- (instancetype)init
{
    self = [super init];
    if (self) {
        _sourceDict = [[NSMutableDictionary alloc] init];
        _taskDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addDownLoadWithDownLoadStr:(NSString *)downLoadStr andPage:(int)page andDownLoadType:(int)downLoadType andIsRefresh:(BOOL)isRefresh;
{
    if(isRefresh) //如果是刷新(比不是刷新少一步判断 是否缓存有数据)
    {   // 刷新 删除数据
        [_sourceDict removeObjectForKey:downLoadStr];
        if(![_taskDict objectForKey:downLoadStr])
        {
            DownLoad *dl = [[DownLoad alloc] init];
            dl.downLoadStr = downLoadStr;
            dl.downLoadType = downLoadType; // 保存下载信息
            dl.delegate = self;
            dl.downLoadPage = page;
            [_taskDict setObject:dl forKey:downLoadStr];
            [dl downLoad];
        }
        else
            NSLog(@"当前下载任务正在下载");
    }
    else
    {
        if([_sourceDict objectForKey:downLoadStr]) // 字串 母串(主key) 都有数据 直接缓存取数据
        {
            if([[_sourceDict objectForKey:downLoadStr] objectForKey:[NSString stringWithFormat:@"%d",page]])
            {
                NSLog(@"有缓存数据");
                [[NSNotificationCenter defaultCenter] postNotificationName:downLoadStr object:nil];
            }
            else // 母串有数据,字串没有 下载
            {
                if(![_taskDict objectForKey:downLoadStr])
                {
                    DownLoad *dl = [[DownLoad alloc] init];
                    dl.downLoadStr = downLoadStr;
                    dl.downLoadType = downLoadType; //保存下载信息
                    dl.delegate = self;
                    dl.downLoadPage = page;
                    [_taskDict setObject:dl forKey:downLoadStr];
                    [dl downLoad];
                }
                else
                    NSLog(@"当前下载任务正在下载");
            }
        }
        else
        {
            if(![_taskDict objectForKey:downLoadStr]) // 母串没有数据 下载
            {
                DownLoad *dl = [[DownLoad alloc] init];
                dl.downLoadStr = downLoadStr;
                dl.downLoadType = downLoadType;
                dl.delegate = self;
                dl.downLoadPage = page;
                [_taskDict setObject:dl forKey:downLoadStr];
                [dl downLoad];
            }
            else
                NSLog(@"当前下载任务正在下载");
        }
        
    }
}

- (void)downLoadFinishWithDownLoad:(DownLoad *)downLoad
{
    [_taskDict removeObjectForKey:downLoad.downLoadStr];
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];

    if(downLoad.downLoadType == 0)
    {

        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:downLoad.downLoadData options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *dataDict = [jsonDict objectForKey:@"data"];
        NSArray *listArray = [dataDict objectForKey:@"list"];
        
        
        for (NSDictionary *listDict in listArray)
        {
            HomeModel *hm = [[HomeModel alloc] init];
            [hm setValuesForKeysWithDictionary:listDict];

            NSMutableArray *itemsArray = [listDict objectForKey:@"items"];
            for (NSDictionary *itemDict in itemsArray)
            {
                ItemsModel *im = [[ItemsModel alloc] init];
                [im setValuesForKeysWithDictionary:itemDict];
                
                NSDictionary *recommendDict = [itemDict objectForKey:@"recommend"];
                [im setValuesForKeysWithDictionary:recommendDict];
                
                [hm.itemsArray addObject:im];
            }
            [dataArray addObject:hm];
        }
        
    }
    else if (downLoad.downLoadType == 1)
    {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:downLoad.downLoadData options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *dataDict = [jsonDict objectForKey:@"data"];
        
        ListModel *lm = [[ListModel alloc] init];
        [lm setValuesForKeysWithDictionary:dataDict];
        
        NSArray *indexBannerArray = [dataDict objectForKey:@"indexBanner"];
        
        for (NSDictionary *indexBannerDict in indexBannerArray)
        {
            BannerModel *bm = [[BannerModel alloc] init];
            [bm setValuesForKeysWithDictionary:indexBannerDict];
            [lm.indexBannerArray addObject:bm];
        }
        
        NSArray *indexWhatArray = [dataDict objectForKey:@"indexWhat"];
        for (NSDictionary *indexWhatDict in indexWhatArray)
        {
            indexWhatModel *iwm = [[indexWhatModel alloc] init];
            [iwm setValuesForKeysWithDictionary:indexWhatDict];
            [lm.indexWhatArray addObject:iwm];
        }
        
        [dataArray addObject:lm];
        
    }
    else if (downLoad.downLoadType == 2)
    {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:downLoad.downLoadData options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *dataDict = [jsonDict objectForKey:@"data"];
        
        NSArray *listArray = [dataDict objectForKey:@"list"];
        for (NSDictionary *listDict in listArray)
        {
            DetailModel *dm = [[DetailModel alloc] init];
            [dm setValuesForKeysWithDictionary:listDict];
            [dataArray addObject:dm];
        }
    }
    
    else if (downLoad.downLoadType == 3)
    {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:downLoad.downLoadData options:NSJSONReadingMutableContainers error:nil];
       
        NSDictionary *dataDict = [jsonDict objectForKey:@"data"];
        NSArray *listArray = [dataDict objectForKey:@"list"];
        for (NSDictionary *listDict in listArray)
        {
            TotalModel *tm = [[TotalModel alloc] init];
            [tm setValuesForKeysWithDictionary:listDict];
            [dataArray addObject:tm];
        }
    }
    else if (downLoad.downLoadType == 4)
    {

 
    }
    else if (downLoad.downLoadType == 5)
    {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:downLoad.downLoadData options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *dataDict = [jsonDict objectForKey:@"data"];
        
        EventTravelModel *etm = [[EventTravelModel alloc] init];
        [etm setValuesForKeysWithDictionary:dataDict];
        
        
        NSMutableArray *productArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dict in [dataDict objectForKey:@"product"])
        {
            EventTravelProductModel *etpm = [[EventTravelProductModel alloc] init];
            [etpm setValuesForKeysWithDictionary:dict];
            [productArray addObject:etpm];
        }
        etm.productArray = productArray;
        
        [dataArray addObject:etm];
    }
    else if (downLoad.downLoadType == 6)
    {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:downLoad.downLoadData options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *dataDict = [jsonDict objectForKey:@"data"];
        
        ListCollectionModel *lcm = [[ListCollectionModel alloc] init];
        [lcm setValuesForKeysWithDictionary:dataDict];
        NSArray *itemsArray = [dataDict objectForKey:@"items"];
        for (NSDictionary *dict in itemsArray)
        {
            ListSubCollectionModel *lscm = [[ListSubCollectionModel alloc] init];
            [lscm setValuesForKeysWithDictionary:dict];
            
            
            ListSubCollectionFrameModel *fm = [[ListSubCollectionFrameModel alloc] init];
            fm.liModel = lscm;
        
            [lcm.itemsArray addObject:fm];
        }
        

        
        [dataArray addObject:lcm];
    }
    else if (downLoad.downLoadType == 7)
    {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:downLoad.downLoadData options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *dataDict = [jsonDict objectForKey:@"data"];
        
        NSArray *listArray = [dataDict objectForKey:@"list"];
        
        for (NSDictionary *listDict in listArray)
        {
            ListAroundModel *lam = [[ListAroundModel alloc] init];
            [lam setValuesForKeysWithDictionary:listDict];
            [dataArray addObject:lam];
        }
    }
    else if (downLoad.downLoadType == 8)
    {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:downLoad.downLoadData options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *dataDict = [jsonDict objectForKey:@"data"];
        
        NSArray *listArray = [dataDict objectForKey:@"list"];
    
        for (NSDictionary *dict in listArray)
        {
            ContentModel *cm = [[ContentModel alloc] init];
            [cm setValuesForKeysWithDictionary:dict];
            [dataArray addObject:cm];
        }
    }
    else if (downLoad.downLoadType == 9)
    {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:downLoad.downLoadData options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *dataDict = [jsonDict objectForKey:@"data"];
        HomeFaModel *hfm = [[HomeFaModel alloc] init];
        [hfm setValuesForKeysWithDictionary:dataDict];
        [dataArray addObject:hfm];
        
    }
    
    
    NSMutableArray *oldArray;
    // 判断之前是否有数据
    if([_sourceDict objectForKey:downLoad.downLoadStr]) // 母串(主键)有数据
    {
        NSDictionary *oldDict = [_sourceDict objectForKey:downLoad.downLoadStr];
        // 取出之前的数据(不知道旧的key值,用了allValues方法)
        oldArray = [NSMutableArray arrayWithArray:[[oldDict allValues] firstObject]];
        // 把新数据添加进去
        [oldArray addObjectsFromArray:dataArray];
        // 实例化一个新的字典，并用新的页(page)作为字串key
        NSDictionary *newDict = [[NSDictionary alloc] initWithObjectsAndKeys:oldArray,[NSString stringWithFormat:@"%d",downLoad.downLoadPage], nil];
        [_sourceDict setObject:newDict forKey:downLoad.downLoadStr];
    }
    else //没有数据  字串有母串(downLoadStr)和页数(page)拼接而成
    {
        
        /**
                  key                   value
            downLoadStr(母串地址)         dict
                ->            key                    value
                        downLoadPage(页数)    dataArray(下载的数据)
         */
        
        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:dataArray,[NSString stringWithFormat:@"%d",downLoad.downLoadPage], nil];
        [_sourceDict setObject:dict forKey:downLoad.downLoadStr];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:downLoad.downLoadStr object:nil];
    
}

- (NSMutableArray *)getDataWithDownLoadStr:(NSString *)downLoadStr
{
    return [((NSArray *)[[_sourceDict objectForKey:downLoadStr] allValues]) firstObject];
}










@end
