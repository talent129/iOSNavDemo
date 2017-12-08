//
//  FourthController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/4.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "FourthController.h"
#import "FFirstController.h"

@interface FourthController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) UIButton *pushBtn;
@property (nonatomic, assign) BOOL isCanUseSideBack;  // 手势是否启动

@end

@implementation FourthController

#pragma mark -lazy load
- (UIButton *)pushBtn
{
    if (!_pushBtn) {
        _pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushBtn setTitle:@"push-FFirst" forState:UIControlStateNormal];
        [_pushBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _pushBtn.backgroundColor = [UIColor blueColor];
        [_pushBtn addTarget:self action:@selector(pushToPersonalInfoVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushBtn;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self cancelSideBack];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self startSideBack];
}

/**
 * 关闭右滑返回
 */
-(void)cancelSideBack{
    self.isCanUseSideBack = NO;
    
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    }
}
/*
 开启右滑返回
 */
- (void)startSideBack {
    self.isCanUseSideBack = YES;
    
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer {
    return self.isCanUseSideBack;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Mine";
    self.navigationController.delegate = self;
    
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

- (void)pushToPersonalInfoVC
{
    FFirstController *vc = [[FFirstController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    BOOL isMinePage = [viewController isKindOfClass:[self class]];
    
    if (isMinePage) {
        navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    }
    [self.navigationController setNavigationBarHidden:isMinePage animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
