//
//  BaseTabBarController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/4.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavController.h"
#import "FirstController.h"
#import "SecondController.h"
#import "ThirdController.h"
#import "FourthController.h"
#import "PublicDefine.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.translucent = NO;//默认YES
    
    [self addViewControllers];
    
    [self setSelectedIndex:0];
    
}

#pragma mark -添加子控制器(导航控制器)
- (void)addViewControllers
{
    FirstController *firstVC = [[FirstController alloc] init];
    BaseNavController *firstNav = [[BaseNavController alloc] initWithRootViewController:firstVC];
    
    SecondController *secondVC = [[SecondController alloc] init];
    BaseNavController *secondNav = [[BaseNavController alloc] initWithRootViewController:secondVC];
    
    ThirdController *thirdVC = [[ThirdController alloc] init];
    BaseNavController *thirdNav = [[BaseNavController alloc] initWithRootViewController:thirdVC];
    
    FourthController *fourthVC = [[FourthController alloc] init];
    BaseNavController *fourthNav = [[BaseNavController alloc] initWithRootViewController:fourthVC];
    
    self.viewControllers = @[firstNav, secondNav, thirdNav, fourthNav];
    
    [self setTabItemIndex:0 withTitle:@"index" withImageName:@"find_normal" withSelectImageName:@"find_selected"];
    [self setTabItemIndex:1 withTitle:@"second" withImageName:@"find_normal" withSelectImageName:@"find_selected"];
    [self setTabItemIndex:2 withTitle:@"third" withImageName:@"find_normal" withSelectImageName:@"find_selected"];
    [self setTabItemIndex:3 withTitle:@"mine" withImageName:@"find_normal" withSelectImageName:@"find_selected"];
}

#pragma mark -自定义item样式
- (void)setTabItemIndex:(NSInteger)index withTitle:(NSString *)title withImageName:(NSString *)normalImage withSelectImageName:(NSString *)selectImage
{
    UITabBarItem *item = [self.tabBar.items objectAtIndex:index];
    [item setTitle:title];
    
    /*
     typedef struct UIOffset {
     CGFloat horizontal, vertical; // specify amount to offset a position, positive for right or down, negative for left or up
     } UIOffset;
     */
    
    UIOffset offset;
    offset.vertical = -2;//正: 向右或向下 负: 向左或向上
    
    ///这里需要两个值都要配置 否则静态分析 报此错误
    ///静态分析: Passed-by-value struct argument contains uninitialized data (e.g., field: 'horizontal')
    offset.horizontal = 0;
    [item setTitlePositionAdjustment:offset];
    
    [item setTitleTextAttributes:@{NSFontAttributeName: Font(11), NSForegroundColorAttributeName: COLOR(@"#999999")} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSFontAttributeName: Font(11), NSForegroundColorAttributeName: kNavBarColor} forState:UIControlStateSelected];
    UIImage *normalImg = [[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item setImage:normalImg];
    UIImage *selectImg = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item setSelectedImage:selectImg];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
