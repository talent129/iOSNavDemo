//
//  ProtocolTextView.h
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/15.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickTextViewPartBlock)(NSString *clickedText);

@interface ProtocolTextView : UITextView


/**
 点击其中部分文字 点击事件

 @param colorHex 部分文字颜色
 @param clickedBlock 点击部分文字响应
 */
- (void)partText:(NSString *)partText partTextColor:(UIColor *)color clickedPartTextBlock:(ClickTextViewPartBlock)clickedBlock;

@end
