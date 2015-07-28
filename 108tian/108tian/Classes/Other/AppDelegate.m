//
//  AppDelegate.m
//  108tian
//
//  Created by SUN on 15-7-12.
//  Copyright (c) 2015年 www.sun.com. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "MyTabbar.h"
#import "FirstStartView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    NSString *vcPlistPath = [[NSBundle mainBundle] pathForResource:@"ViewController.plist" ofType:nil];
    NSArray *vcArray = [NSArray arrayWithContentsOfFile:vcPlistPath];
 
    NSMutableArray *controlArray = [NSMutableArray array];
    for (NSDictionary *dict in vcArray)
    {
        RootViewController *rvc = [[NSClassFromString([dict objectForKey:@"viewcontrollername"]) alloc] init];
        rvc.vcTitle = [dict objectForKey:@"viewcontrollertitle"];
        rvc.vcURLString = [dict objectForKey:@"viewcontrollerurl"];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rvc];
        nav.navigationBarHidden = YES;
        [controlArray addObject:nav];
    }
    
    self.tbc = [[UITabBarController alloc] init];
    _tbc.viewControllers = controlArray;
    _tbc.selectedIndex = 0;
    self.window.rootViewController = _tbc;
    
    _mt = [[MyTabbar alloc] init];
    _mt.frame = _tbc.tabBar.bounds;
    
    NSDictionary *tabDict = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Tabbar" ofType:@"plist"]];
    [_mt createMyTabbarWithTabbarDict:tabDict andClass:self andSEL:@selector(btnClick:)];
    [_tbc.tabBar addSubview:_mt];
    
    ((UIButton *)[((UIView *)[_mt.subviews objectAtIndex:2]).subviews objectAtIndex:0]).selected = YES;
    ((UILabel *)[((UIView *)[_mt.subviews objectAtIndex:2]).subviews objectAtIndex:1]).textColor = [UIColor colorWithRed:0.33f green:0.76f blue:0.71f alpha:1.00f];
    
    /**
     *  测试使用
     */
    _tbc.selectedIndex = 2;
    [self createFirstView];
    
    
    self.window.backgroundColor = [UIColor clearColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)createFirstView
{
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"isFirstStart"])
    {
        FirstStartView *fsv = [[FirstStartView alloc] init];
        fsv.frame = self.window.bounds;
        [fsv createFirstStartView];
        [_tbc.view addSubview:fsv];
    }
}


-(void)btnClick:(UIButton *)btn
{
    

    ((UIButton *)[((UIView *)[btn.superview.superview.subviews objectAtIndex:_tbc.selectedIndex + 1]).subviews objectAtIndex:0]).selected = NO;
    ((UILabel *)[((UIView *)[btn.superview.superview.subviews objectAtIndex:_tbc.selectedIndex + 1]).subviews objectAtIndex:1]).textColor = [UIColor colorWithRed:0.56f green:0.56f blue:0.56f alpha:1.00f];
    
    
    ((UIButton *)[((UIView *)[btn.superview.superview.subviews objectAtIndex:btn.tag + 1]).subviews objectAtIndex:0]).selected = YES;
    ((UILabel *)[((UIView *)[btn.superview.superview.subviews objectAtIndex:btn.tag + 1]).subviews objectAtIndex:1]).textColor = [UIColor colorWithRed:0.33f green:0.76f blue:0.71f alpha:1.00f];
    
    _tbc.selectedIndex = btn.tag;
}






- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
