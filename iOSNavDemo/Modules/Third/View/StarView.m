//
//  StarView.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/20.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "StarView.h"
#import "PublicDefine.h"
#import "Masonry.h"
#import "UIView+Ext.h"

@interface StarView ()

@property (nonatomic, strong) UIView *grayView;
@property (nonatomic, strong) UIView *yellowView;

@end

@implementation StarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createView];
    }
    return self;
}

- (void)createView
{
    self.backgroundColor = [UIColor cyanColor];
    
    UIImage *grayImg = IMAGE(@"gray");
    UIImage *yellowImg = IMAGE(@"yellow");
    
    //创建灰色星星视图
    _grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, grayImg.size.width * 5, grayImg.size.height)];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayImg];
    [self addSubview:_grayView];
    
    //创建黄色的星星
    _yellowView = [[UIView alloc] initWithFrame:_grayView.bounds];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImg];
    [self addSubview:_yellowView];
    
    //让当前视图的宽度等于高度的5倍
    self.width = self.height * 5;
    
    //星星要进行缩放
    //计算缩放的倍数
    CGFloat scale = self.height / grayImg.size.height;
    _grayView.transform = CGAffineTransformMakeScale(scale, scale);
    _yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    
    //当星星视图修改了transform后，坐标会变，需要重新恢复坐标
    _grayView.origin = CGPointMake(0, 0);
    _yellowView.origin = CGPointZero;
    
    //设置背景为透明
    self.backgroundColor = [UIColor clearColor];
}

- (void)setRate:(CGFloat)rate
{
    _rate = rate;
    
    _yellowView.width = rate / 10.0 * _grayView.width;
}

@end
