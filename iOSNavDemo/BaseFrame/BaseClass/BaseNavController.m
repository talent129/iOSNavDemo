//
//  BaseNavController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/4.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "BaseNavController.h"
#import "Const.h"

@interface BaseNavController ()

@end

@implementation BaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ///状态栏风格-light
    self.navigationBar.barStyle = UIStatusBarStyleLightContent;
    
    ///设置导航栏风格
    ///1. 导航栏颜色-去除黑线: BaseController -> viewDidLoad -> navigationStyle
    self.navigationBar.barTintColor = kNavBarColor;
    self.navigationBar.translucent = NO;//导航栏不透明
    
//    ///2. 导航栏背景图片 - 此种情况BaseController -> viewDidLoad -> navigationStyle可不必打开
//    [self.navigationBar setBackgroundImage:IMAGE(@"navPic_snow") forBarMetrics:UIBarMetricsDefault];
//    //去除导航栏底部黑线
//    [self.navigationBar setShadowImage:[UIImage new]];
    
    //设置导航栏title属性
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //侧滑返回
    self.interactivePopGestureRecognizer.delegate = (id)self;
    
}

//重写系统push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
