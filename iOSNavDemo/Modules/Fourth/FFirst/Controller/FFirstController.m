//
//  FFirstController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/4.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "FFirstController.h"
#import "FSecondController.h"

@interface FFirstController ()

@property (nonatomic, strong) UIButton *pushBtn;

@end

@implementation FFirstController

#pragma mark -lazy load
- (UIButton *)pushBtn
{
    if (!_pushBtn) {
        _pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushBtn setTitle:@"push-FSecond" forState:UIControlStateNormal];
        [_pushBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _pushBtn.backgroundColor = [UIColor blueColor];
        [_pushBtn addTarget:self action:@selector(pushToIdentificationVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushBtn;
}

#pragma mark -改变导航栏颜色
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithDecimalRed:253 green:128 blue:35 alpha:1]] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"FFirst";
    [self createUI];
}

#pragma mark -createUI
- (void)createUI
{
    [self.view addSubview:self.pushBtn];
    [self.pushBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(SCREEN_Width - 30, 49));
    }];
}

- (void)pushToIdentificationVC
{
    FSecondController *vc = [[FSecondController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
