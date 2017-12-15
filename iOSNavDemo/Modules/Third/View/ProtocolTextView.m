//
//  ProtocolTextView.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/15.
//  Copyright © 2017年 Curtis. All rights reserved.
//  参考: http://www.jianshu.com/p/1eb6c2c86cfb 修改了下

#import "ProtocolTextView.h"
#import "PublicDefine.h"

@interface ProtocolTextView ()

@property (nonatomic, strong) NSMutableArray *rectsArray;
@property (nonatomic, strong) NSMutableAttributedString *content;

@end

@implementation ProtocolTextView

- (NSMutableArray *)rectsArray
{
    if (!_rectsArray) {
        _rectsArray = [NSMutableArray array];
    }
    return _rectsArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setEditable:NO];
        [self setScrollEnabled:NO];
        self.selectable = NO;//关闭 去掉选择效果
    }
    return self;
}

///重写set方法
- (void)setText:(NSString *)text
{
    [super setText:text];
    // 设置的text的相关属性，都添加到content中
    self.content = [[NSMutableAttributedString alloc] initWithString:text];
    [self.content addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, text.length)];
    if(self.textColor){
        [self.content addAttribute:NSForegroundColorAttributeName value:self.textColor range:NSMakeRange(0, text.length)];
    }
}

/**
 点击部分文字响应

 @param partText 部分文字
 @param colorHex 部分文字颜色
 @param clickedBlock 点击部分文字响应block
 */
- (void)partText:(NSString *)partText partTextColor:(UIColor *)color clickedPartTextBlock:(ClickTextViewPartBlock)clickedBlock
{
    NSRange range = [self.text rangeOfString:partText];
    if (self.text.length < range.location + range.length) {
        return;
    }
    
//    //设置下划线
//    [self.content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    
    //设置文字颜色
    if (color) {
        [self.content addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    
    self.attributedText = self.content;
    
    // 设置下划线文字的点击事件
    // self.selectedRange  影响  self.selectedTextRange
    self.selectedRange = range;
    
    // 获取选中范围内的矩形框
    NSArray *selectionRects = [self selectionRectsForRange:self.selectedTextRange];
    // 清空选中范围
    self.selectedRange = NSMakeRange(0, 0);
    
    // 可能会点击的范围的数组
    NSMutableArray *selectedArray = [NSMutableArray array];
    for (UITextSelectionRect *selectionRect in selectionRects) {
        CGRect rect = selectionRect.rect;
        if (rect.size.width == 0 || rect.size.height == 0) {
            continue;
        }
        // 将有用的信息打包<存放到字典中>存储到数组中
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        // 存储文字对应的frame，一段文字可能会有两个甚至多个frame，考虑到文字换行问题
        [dic setObject:[NSValue valueWithCGRect:rect] forKey:@"rect"];
        // 存储下划线对应的文字
        [dic setObject:[self.text substringWithRange:range] forKey:@"content"];
        // 存储相应的回调的block
        [dic setObject:clickedBlock forKey:@"block"];
        [selectedArray addObject:dic];
    }
    
    // 将可能点击的范围的数组存储到总的数组中
    [self.rectsArray addObject:selectedArray];
    
}

// 点击textView的 touchesBegan 方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取触摸对象
    UITouch *touch = [touches anyObject];
    
    // 触摸点
    CGPoint point = [touch locationInView:self];
    // 通过一个触摸点，查询点击的是不是在下划线对应的文字的frame
    NSArray *selectedArray = [self touchingSpecialWithPoint:point];
    
    if (selectedArray.count) {
        // 如果说有点击效果的话，加个延时，展示下点击效果,如果没有点击效果的话，直接回调
        NSDictionary *dic = [selectedArray firstObject];
        ClickTextViewPartBlock block = dic[@"block"];
        block(dic[@"content"]);
    }
}

- (NSArray *)touchingSpecialWithPoint:(CGPoint)point
{
    // 从所有的特殊的范围中找到点击的那个点
    for (NSArray *selecedArray in self.rectsArray) {
        for (NSDictionary *dic in selecedArray) {
            CGRect myRect = [dic[@"rect"] CGRectValue];
            if(CGRectContainsPoint(myRect, point) ){
                return selecedArray;
            }
        }
    }
    return nil;
}

@end
