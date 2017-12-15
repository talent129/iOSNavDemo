//
//  ProtocolTestController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/12.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "ProtocolTestController.h"

@interface ProtocolTestController ()

@property (nonatomic, strong) UIButton *pushBtn;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIView *contentView;

@end

@implementation ProtocolTestController

#pragma mark -lazy load
- (UIButton *)pushBtn
{
    if (!_pushBtn) {
        _pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushBtn setTitle:@"Protocol" forState:UIControlStateNormal];
        [_pushBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _pushBtn.titleLabel.font = Font(15);
        _pushBtn.backgroundColor = kNavBarColor;
        [_pushBtn addTarget:self action:@selector(alertProtocol) forControlEvents:UIControlEventTouchUpInside];
        _pushBtn.layer.masksToBounds = YES;
        _pushBtn.layer.cornerRadius = 8;
    }
    return _pushBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
    
}

- (void)createUI
{
    [self.view addSubview:self.pushBtn];
    [self.pushBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(SCREEN_Width - 30, 49));
    }];
}

- (void)alertProtocol
{
    UIView *maskView = [[UIView alloc] initWithFrame:BOUNDS];
    maskView.backgroundColor = [UIColor colorWithDecimalRed:0 green:0 blue:0 alpha:0.6];
    [[UIApplication sharedApplication].keyWindow addSubview:maskView];
    self.maskView = maskView;
    
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.masksToBounds = YES;
    contentView.layer.cornerRadius = 8;
    [maskView addSubview:contentView];
    self.contentView = contentView;
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(maskView);
        make.size.mas_equalTo(CGSizeMake(SCREEN_Width - 60, SCREEN_Height - (StatusBarHeight + 10) * 2));
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"用户协议和隐私条款";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = Font(16);
    titleLabel.textColor = [UIColor blackColor];
    [contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.top.equalTo(contentView);
        make.size.mas_equalTo(CGSizeMake(SCREEN_Width, 50));
    }];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = Font(16);
    [confirmBtn addTarget:self action:@selector(confirmBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.bottom.equalTo(contentView);
        make.size.mas_equalTo(CGSizeMake(SCREEN_Width, 50));
    }];
    
    UIView *line = [UIView new];
    line.backgroundColor = COLOR(@"#efefef");
    [contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(@0);
        make.bottom.equalTo(confirmBtn.mas_top);
        make.height.equalTo(@0.5);
    }];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(@0);
        make.top.equalTo(titleLabel.mas_bottom);
        make.bottom.equalTo(line.mas_top);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"审美完整性代表了应用程序的外观和行为与其功能的整合程度。例如，帮助人们执行严肃任务的应用程序可以通过使用微妙的，不显眼的图形，标准控件和可预测的行为来使他们保持专注。另一方面，身临其境的应用程序，如游戏，可以提供令人着迷的外观，有趣的和令人兴奋的，同时鼓励发现。审美完整性代表了应用程序的外观和行为与其功能的整合程度。例如，帮助人们执行严肃任务的应用程序可以通过使用微妙的，不显眼的图形，标准控件和可预测的行为来使他们保持专注。另一方面，身临其境的应用程序，如游戏，可以提供令人着迷的外观，有趣的和令人兴奋的，同时鼓励发现。审美完整性代表了应用程序的外观和行为与其功能的整合程度。例如，帮助人们执行严肃任务的应用程序可以通过使用微妙的，不显眼的图形，标准控件和可预测的行为来使他们保持专注。另一方面，身临其境的应用程序，如游戏，可以提供令人着迷的外观，有趣的和令人兴奋的，同时鼓励发现。审美完整性代表了应用程序的外观和行为与其功能的整合程度。例如，帮助人们执行严肃任务的应用程序可以通过使用微妙的，不显眼的图形，标准控件和可预测的行为来使他们保持专注。另一方面，身临其境的应用程序，如游戏，可以提供令人着迷的外观，有趣的和令人兴奋的，同时鼓励发现。审美完整性代表了应用程序的外观和行为与其功能的整合程度。例如，帮助人们执行严肃任务的应用程序可以通过使用微妙的，不显眼的图形，标准控件和可预测的行为来使他们保持专注。另一方面，身临其境的应用程序，如游戏，可以提供令人着迷的外观，有趣的和令人兴奋的，同时鼓励发现。审美完整性代表了应用程序的外观和行为与其功能的整合程度。例如，帮助人们执行严肃任务的应用程序可以通过使用微妙的，不显眼的图形，标准控件和可预测的行为来使他们保持专注。另一方面，身临其境的应用程序，如游戏，可以提供令人着迷的外观，有趣的和令人兴奋的，同时鼓励发现。审美完整性代表了应用程序的外观和行为与其功能的整合程度。例如，帮助人们执行严肃任务的应用程序可以通过使用微妙的，不显眼的图形，标准控件和可预测的行为来使他们保持专注。另一方面，身临其境的应用程序，如游戏，可以提供令人着迷的外观，有趣的和令人兴奋的，同时鼓励发现。审美完整性代表了应用程序的外观和行为与其功能的整合程度。例如，帮助人们执行严肃任务的应用程序可以通过使用微妙的，不显眼的图形，标准控件和可预测的行为来使他们保持专注。另一方面，身临其境的应用程序，如游戏，可以提供令人着迷的外观，有趣的和令人兴奋的，同时鼓励发现。审美完整性代表了应用程序的外观和行为与其功能的整合程度。例如，帮助人们执行严肃任务的应用程序可以通过使用微妙的，不显眼的图形，标准控件和可预测的行为来使他们保持专注。另一方面，身临其境的应用程序，如游戏，可以提供令人着迷的外观，有趣的和令人兴奋的，同时鼓励发现。";
    label.textColor = [UIColor blackColor];
    label.font = Font(15);
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0;
    
    CGSize size = [self labelRectWithSize:CGSizeMake(SCREEN_Width - 60 - 20, MAXFLOAT) LabelText:label.text Font:Font(15)];
    
    scrollView.contentSize = CGSizeMake(SCREEN_Width - 60 - 20, size.height + 15);
    label.frame = CGRectMake(15, 0, SCREEN_Width - 60 - 20, size.height + 15);
    [scrollView addSubview:label];
    
    [UIView animateWithDuration:0.1 animations:^{
        contentView.transform = CGAffineTransformMakeScale(1.05, 1.05);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{
            contentView.transform = CGAffineTransformMakeScale(1.02, 1.02);
        }];
    }];
    
}

- (void)confirmBtnAction
{
    if (_maskView != nil) {
        [UIView animateWithDuration:0.25 animations:^{
            
            _contentView.transform = CGAffineTransformMakeScale(0.8, 0.8);
            _maskView.alpha = 0;
            
        } completion:^(BOOL finished) {
            [_maskView removeFromSuperview];
            _maskView = nil;
        }];
    }
}

- (CGSize)labelRectWithSize:(CGSize)size
                 LabelText:(NSString *)labelText
                      Font:(UIFont *)font{
    
    NSDictionary  *dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    CGSize rect = [labelText boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return rect;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
