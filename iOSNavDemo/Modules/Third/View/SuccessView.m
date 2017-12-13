//
//  SuccessView.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/13.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "SuccessView.h"
#import "PublicDefine.h"

@interface SuccessView ()
{
    UIView *_circleView;
}

@end

@implementation SuccessView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self drawSuccessView];
    }
    return self;
}

- (void)hideSuccessView
{
    if (_circleView) {
        [_circleView removeFromSuperview];
        _circleView = nil;
    }
}

- (void)drawSuccessView
{
    [self hideSuccessView];
    
    _circleView = [[UIView alloc] initWithFrame:self.bounds];
    
    /**
     绘制圆弧
     
     ArcCenter 圆弧中心
     radius 半径
     startAngle 开始弧度
     endAngle 结束弧度
     clockwise 顺时针/逆时针
     */
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) radius:self.frame.size.width/2.0 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    //设置线段两端样式
    path.lineCapStyle  = kCGLineCapRound;
    //设置线段连接处的样式
    path.lineJoinStyle = kCGLineCapRound;
    
    //对号第一部分直线的起始
    [path moveToPoint:CGPointMake(self.frame.size.width/5.0, self.frame.size.width/2.0)];
    CGPoint p1 = CGPointMake(self.frame.size.width/5.0 * 2, self.frame.size.width/4.0 * 3);
    [path addLineToPoint:p1];
    
    //对号第二部分起始
    CGPoint p2 = CGPointMake(self.frame.size.width/8.0 * 7, self.frame.size.width/3.0);
    [path addLineToPoint:p2];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    //内部填充颜色
    layer.fillColor = [UIColor clearColor].CGColor;
    //线条颜色
    layer.strokeColor = [UIColor orangeColor].CGColor;
    //线条宽度
    layer.lineWidth = 1;
    layer.path = path.CGPath;
    
    //动画设置
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 2;
    [layer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
    [_circleView.layer addSublayer:layer];
    [self addSubview:_circleView];
    
//    ///移除
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self hideSuccessView];
//    });
    
}

@end
