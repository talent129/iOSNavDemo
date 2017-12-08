//
//  AppDelegate.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/1.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "AppDelegate.h"
#import "PublicDefine.h"
#import "BaseTabBarController.h"
#import "Const.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //适配iOS11
    [self appearanceConfiguration];
    
    self.window = [[UIWindow alloc] initWithFrame:BOUNDS];
    
    self.window.backgroundColor = kVCViewColor;//控制器背景颜色
//    self.window.backgroundColor = kNavBarColor;//导航栏颜色
//    self.window.backgroundColor = [UIColor colorWithPatternImage:IMAGE(@"navPic_snow")];//导航
    BaseTabBarController *tab = [[BaseTabBarController alloc] init];
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark -适配iOS11
- (void)appearanceConfiguration
{
    if (@available(iOS 11.0, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        [UITableView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        [UICollectionView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        [UIWebView appearance].scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        //底下这三句是解决mjrefresh 上拉偏移的bug
        [UITableView appearance].estimatedRowHeight = 0;
        [UITableView appearance].estimatedSectionHeaderHeight = 0;
        [UITableView appearance].estimatedSectionFooterHeight = 0;
    } else {
        // Fallback on earlier versions
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
