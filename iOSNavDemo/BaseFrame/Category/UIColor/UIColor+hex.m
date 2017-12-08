//
//  UIColor+hex.m
//  CalendarDemo
//
//  Created by mac on 17/5/4.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "UIColor+hex.h"

@implementation UIColor (hex)

+ (id) colorWithHex:(unsigned int)hex{
    return [UIColor colorWithHex:hex alpha:1];
}

+ (id) colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha{
    
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0
                           alpha:alpha];
    
}

+ (UIColor *)themeColor{
    return [UIColor colorWithRed:0.99 green:0.40 blue:0.55 alpha:1];
}

+ (UIColor *)colorWithDecimalRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    //去掉字符串首位的空格，并且返回新的字符串
    NSString *hex = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([hex length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([hex hasPrefix:@"0X"])
        hex = [hex substringFromIndex:2];
    if ([hex hasPrefix:@"#"])
        hex = [hex substringFromIndex:1];
    if ([hex length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *redString = [hex substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *greenString = [hex substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *blueString = [hex substringWithRange:range];
    
    // Scan values  将16进制数转换为10进制  分别存到r,g,b中
    unsigned int red, green, blue;
    [[NSScanner scannerWithString:redString] scanHexInt:&red];
    [[NSScanner scannerWithString:greenString] scanHexInt:&green];
    [[NSScanner scannerWithString:blueString] scanHexInt:&blue];
    
    return [UIColor colorWithDecimalRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    return [UIColor colorWithHexString:hexString alpha:1];
}

@end
