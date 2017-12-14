//
//  BaseNavController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/4.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "BaseNavController.h"
#import "Const.h"
#import "UIImage+ColorCreateImage.h"

@interface BaseNavController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation BaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ///状态栏风格-light
    self.navigationBar.barStyle = UIStatusBarStyleLightContent;
    
    ///设置导航栏风格
    ///1. 导航栏背景图片 - 颜色生成纯色图片
    [self.navigationBar setBackgroundImage:[UIImage createImageWithColor:kNavBarColor] forBarMetrics:UIBarMetricsDefault];
    ///去除导航栏底部横线
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    
//    ///2. 导航栏背景图片
//    [self.navigationBar setBackgroundImage:IMAGE(@"navPic_snow") forBarMetrics:UIBarMetricsDefault];
//    //去除导航栏底部横线
//    [self.navigationBar setShadowImage:[UIImage new]];
    
    //设置导航栏title属性
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
//    //侧滑返回
//    self.interactivePopGestureRecognizer.delegate = (id)self;
    
    [self popGesture];
}

- (void)popGesture
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled  = YES;
        self.interactivePopGestureRecognizer.delegate = self;
        self.delegate = self;
    }
}

//重写系统push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark -UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer)
    {
        if (self.viewControllers.count == 1)
        {
            return NO;
        }
    }
    return YES;
}

- (void)dealloc
{
    NSLog(@"--dealloc: %@", NSStringFromClass([self class]));
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate = nil;
        self.delegate = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
