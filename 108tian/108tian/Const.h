//
//  Const.h
//  108tian
//
//  Created by SUN on 15-7-17.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

// 颜色
#define HMColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HMColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
// 随机色
#define HMRandomColor HMColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define PreURL @"http://pic.108tian.com/pic/"


// 周边
#define Around_URL @"https://api.108tian.com/mobile/v2/SceneList?page=0&cityId=1&step=10&uuid=f5471feaca28dc58721eebb3bb0ffb0b75ae1546"
// 农家院
#define House_URL @"https://api.108tian.com/mobile/v2/FarmList?page=0&cityId=1&step=10&uuid=f5471feaca28dc58721eebb3bb0ffb0b75ae1546"
// 度假村
#define Holiday_URL @"https://api.108tian.com/mobile/v2/ResortList?page=0&cityId=1&step=10&uuid=f5471feaca28dc58721eebb3bb0ffb0b75ae1546"
// 采摘园
#define Pick_URL @"https://api.108tian.com/mobile/v2/PickList?page=0&cityId=1&step=10&uuid=f5471feaca28dc58721eebb3bb0ffb0b75ae1546"
