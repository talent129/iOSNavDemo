//
//  FirstController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/4.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "FirstController.h"
#import "FTestController.h"
#import "UIImage+ColorCreateImage.h"

@interface FirstController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) UIButton *pushBtn;
@property (nonatomic, assign) BOOL isCanUseSideBack;  // 手势是否启动

@end

@implementation FirstController

#pragma mark -lazy load
- (UIButton *)pushBtn
{
    if (!_pushBtn) {
        _pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushBtn setTitle:@"push-FTest" forState:UIControlStateNormal];
        [_pushBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _pushBtn.titleLabel.font = Font(15);
        _pushBtn.backgroundColor = kNavBarColor;
        [_pushBtn addTarget:self action:@selector(pushToFTestVC) forControlEvents:UIControlEventTouchUpInside];
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
    
    self.navigationItem.title = @"First";
    
    [self createUI];
    
    self.navigationController.delegate = self;
}

#pragma mark -createUI
- (void)createUI
{
    [self.view addSubview:self.pushBtn];
    [self.pushBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(SCREEN_Width - 30, 49));
    }];
    
    ///颜色转图片测试
    UIImage *img = [UIImage createImageWithColor:COLOR(@"#55a3f2")];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 100, SCREEN_Width - 30, 50)];
    imgView.image = img;
    [self.view addSubview:imgView];
    
    UILabel *descr = [[UILabel alloc] init];
    descr.text = @"颜色转图片测试-非按钮";
    descr.textColor = [UIColor cyanColor];
    descr.font = Font(15);
    descr.textAlignment = NSTextAlignmentCenter;
    [imgView addSubview:descr];
    [descr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(imgView);
    }];
}

- (void)pushToFTestVC
{
    FTestController *vc = [[FTestController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    BOOL isIndexPage = [viewController isKindOfClass:[self class]];
    
    UIImageView *navBarBackground = self.navigationController.navigationBar.subviews.firstObject;
    
    if (isIndexPage) {
        navBarBackground.alpha = 1;
        navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
        [self.backButton setImage:IMAGE(@"navLeft") forState:UIControlStateNormal];
        [self.backButton setImage:IMAGE(@"navLeft") forState:UIControlStateHighlighted];
        //设置导航栏title属性
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
