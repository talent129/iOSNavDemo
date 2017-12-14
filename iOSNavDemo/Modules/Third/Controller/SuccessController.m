//
//  SuccessController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/13.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "SuccessController.h"
#import "SuccessView.h"

@interface SuccessController ()

@property (nonatomic, strong) UIView *animationView;
@property (nonatomic, strong) UIImageView *bgImgView;
@property (nonatomic, strong) UIImageView *lightImgView;

@property (nonatomic, strong) UIButton *startBtn;
@property (nonatomic, strong) UIButton *stopBtn;

@end

@implementation SuccessController

#pragma mark -
- (UIView *)animationView
{
    if (_animationView == nil) {
        _animationView = [UIView new];
        _animationView.frame = CGRectMake(SCREEN_Width/2.0 - 30, 180, 60, 60);
        _animationView.backgroundColor = [UIColor clearColor];
        
        [_animationView addSubview:self.bgImgView];
        [_animationView addSubview:self.lightImgView];
        
        UIView *view = _animationView;
        [self.lightImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(view);
        }];
        
        [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(view);
        }];
    }
    
    return _animationView;
}

- (UIImageView *)bgImgView
{
    if (!_bgImgView) {
        _bgImgView = [[UIImageView alloc] init];
        _bgImgView.image = [UIImage imageNamed:@"loading_bg"];
    }
    return _bgImgView;
}

- (UIImageView *)lightImgView
{
    if (!_lightImgView) {
        _lightImgView = [[UIImageView alloc] init];
        _lightImgView.image = [UIImage imageNamed:@"loading"];
    }
    return _lightImgView;
}

- (UIButton *)startBtn
{
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startBtn setTitle:@"start" forState:UIControlStateNormal];
        [_startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _startBtn.titleLabel.font = Font(15);
        _startBtn.backgroundColor = kNavBarColor;
        [_startBtn addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}

- (UIButton *)stopBtn
{
    if (!_stopBtn) {
        _stopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_stopBtn setTitle:@"stopBtn" forState:UIControlStateNormal];
        [_stopBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _stopBtn.titleLabel.font = Font(15);
        _stopBtn.backgroundColor = kNavBarColor;
        [_stopBtn addTarget:self action:@selector(stopAnimation) forControlEvents:UIControlEventTouchUpInside];
    }
    return _stopBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"动画";
    
    SuccessView *suc = [[SuccessView alloc] initWithFrame:CGRectMake(SCREEN_Width/2.0 - 30, 100, 60, 60)];
    [self.view addSubview:suc];
    
    [self.view addSubview:self.startBtn];
    [self.view addSubview:self.stopBtn];
    [self.startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_Width - 30, 30));
        make.center.equalTo(self.view);
    }];
    
    [self.stopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_Width - 30, 30));
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).mas_offset(40);
    }];
}

- (void)stopAnimation{
    
    [self.lightImgView.layer removeAllAnimations];
    
    if (_animationView) {
        [_animationView removeFromSuperview];
        _animationView = nil;
    }
}

- (void)startAnimation
{
    [self.view addSubview:self.animationView];
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotationAnimation.duration = 2;
    rotationAnimation.repeatCount = NSIntegerMax;
    rotationAnimation.cumulative = NO;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
    [self.lightImgView.layer addAnimation:rotationAnimation forKey:@"Rotation"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
