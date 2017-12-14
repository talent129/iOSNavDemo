//
//  PublicDefine.h
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/4.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#ifndef PublicDefine_h
#define PublicDefine_h

#import "UIColor+hex.h"

/* 字符串是否为空 */
#define StrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))
/* 是否为空或是[NSNull null] */
#define NilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ([(_ref) isEqual:@"null"]) || ([(_ref) isEqual:@"(null)"]))
/* 16进制颜色转化 */
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/* 常用frame */
#define BOUNDS [[UIScreen mainScreen] bounds]
#define SCREEN_Width    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_Height   ([UIScreen mainScreen].bounds.size.height)

#define _CGP(x, y)                                      CGPointMake(x, y)
#define _CGS(w, h)                                      CGSizeMake(w, h)
#define _CGR(x, y, w, h)                                CGRectMake(x, y, w, h)

/* 区分屏幕 */
#define IPHONE4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//状态栏高度
#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

//导航栏高度
#define kNavBarHeight (StatusBarHeight + 44)

//系统版本判断
#define IOS11_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"11.0"] != NSOrderedAscending )
#define IOS10_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"10.0"] != NSOrderedAscending )
#define IOS9_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"9.0"] != NSOrderedAscending )
#define IOS8_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
#define IOS7_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS6_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define IOS5_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"5.0"] != NSOrderedAscending )
#define IOS4_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"4.0"] != NSOrderedAscending )
#define IOS3_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] compare:@"3.0"] != NSOrderedAscending )

/* 显示打印行 */
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr, "[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

/* app版本号 */
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/* app build */
#define kAppBuild [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/* 系统版本号 */
#define kSystemVersion [[UIDevice currentDevice] systemVersion]

//获取当前语言
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//判断是否为iPhone 返回BOOL类型
#define kISiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//判断是否为iPad 返回BOOL类型
#define kISiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//获取沙盒Document路径
#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒temp路径
#define kTempPath NSTemporaryDirectory()

//获取沙盒Cache路径
#define kCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

/**
 *设置rgb颜色
 *@prame a 透明度
 */
#define RGBA(r,g,b,a)      [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]

// 单例
#undef    AS_SINGLETON
#define AS_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef    DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__ = nil; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}

//字体大小-系统--standard
#define Font(X) [UIFont systemFontOfSize:X]

//bold-系统
#define BoldFont(X) [UIFont boldSystemFontOfSize:X]

//block self
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

// 图片名称
#define IMAGE(string) [UIImage imageNamed:string]

// 十六进制颜色
#define COLOR(String) [UIColor colorWithHexString:String]

#define RETINA_1PX 1.f/[UIScreen mainScreen].scale

#define _REMOVEALLSUBVIEWS_(__superview__) \
do {[__superview__.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];} while(0)

#define INVALIDATE_TIMER(__timer__) do{ [__timer__ invalidate]; __timer__ = nil; } while(0)

#ifndef _CLEAR_BACKGROUND_COLOR_
#define _CLEAR_BACKGROUND_COLOR_(_view_) \
do {[_view_ setBackgroundColor:[UIColor clearColor]];} while(0)
#endif

#ifndef _ALLOC_OBJ_
#define _ALLOC_OBJ_(__obj_class__) \
[[__obj_class__ alloc]init]
#endif

#ifndef _ALLOC_OBJ_WITHFRAME_
#define _ALLOC_OBJ_WITHFRAME_(__obj_class__, __frame__) \
[[__obj_class__ alloc]initWithFrame:__frame__]
#endif

#ifndef _ALLOC_VC_CLASS_
#define _ALLOC_VC_CLASS_(__vc_class__)\
_ALLOC_VC_CLASS_XIB_(__vc_class__, NSStringFromClass(__vc_class__))
#endif

#ifndef _ALLOC_VC_CLASS_XIB_
#define _ALLOC_VC_CLASS_XIB_(__vc_class__, __xib_name__)\
[[__vc_class__ alloc]initWithNibName:__xib_name__ bundle:nil];
#endif

#ifndef _ALLOC_VIEW_CLASS_XIB_
#define _ALLOC_VIEW_CLASS_XIB_(__view_class__)\
[[UIView class] wm_loadViewXib:__view_class__]
#endif

#define _LOADVC_FROMSTORYBORAD_(__storyboardname__, __vc_name__)\
[[UIStoryboard storyboardWithName:__storyboardname__ bundle:nil] instantiateViewControllerWithIdentifier:__vc_name__];

//****************************************property****************************************/
#define _PROPERTY_NONATOMIC_READONLY(__class__, __property__)\
@property(nonatomic, readonly)__class__  * __property__;

#define _PROPERTY_NONATOMIC_ASSIGN(__class__, __property__)\
@property (nonatomic, assign)__class__  __property__;

#define _PROPERTY_NONATOMIC_COPY(__class__, __property__)\
@property (nonatomic, copy)__class__  *__property__;

#define _PROPERTY_NONATOMIC_WEAK(__class__, __property__)\
@property (nonatomic, weak)__class__    __property__;

#define _PROPERTY_NONATOMIC_STRONG(__class__, __property__)\
@property (nonatomic, strong) __class__ *__property__;

#define _PROPERTY_NONATOMIC_STRONG_IGNORE(__class__, __property__)\
_PROPERTY_NONATOMIC_STRONG(__class__<Ignore>, __property__);

#define _PROPERTY_NONATOMIC_STRONG_OPTION(__class__, __property__)\
_PROPERTY_NONATOMIC_STRONG(__class__<Optional>, __property__);

//****************************************GETTER****************************************/
#define _GETTER_BEGIN(__class__, __property__) \
- (__class__*)__property__ \
{\
if(!_##__property__)\
{\


#define _GETTER_ALLOC_BEGIN(__class__, __property__) \
- (__class__*)__property__ \
{\
if(!_##__property__)\
{\
_##__property__ = _ALLOC_OBJ_(__class__);


#define _GETTER_ALLOC_FRAME_BEGIN(__class__, __property__, __frame__) \
- (__class__*)__property__ \
{\
if(!_##__property__)\
{\
_##__property__ = _ALLOC_OBJ_WITHFRAME_(__class__, __frame__);


#define _GETTER_END(__property__) \
}\
return _##__property__;\
}
//****************************************getter宏****************************************/

//****************************************setter宏****************************************/
#define __SETTER_STRONG__(__property__)\
{\
if(_##__property__ != __property__)\
{\
_##__property__ = nil;\
_##__property__ = __property__;\
}\
}

#define _SETTER_COPY(__property__)\
{\
if(_##__property__ != __property__)\
{\
_##__property__  = nil;\
_##__property__ = [__property__ copy];\
}\
}
//=========setter宏============

#define _SETLABEL_STYLE(_label,font,textcolor,text)\
if([_label isKindOfClass:[UILabel class]])\
{\
[_label setFont:[UIFont systemFontOfSize:font]];\
[_label setTextColor:textcolor];\
[_label setText:text];\
}
#define _CREATE_LABEL_AND_ADDSUBVIEW(__label__, __frame__, __align__, __font__,__superView__,__text__,__color__)\
{\
__label__ = _ALLOC_OBJ_WITHFRAME_(UILabel, __frame__);\
[__label__ setBackgroundColor:[UIColor clearColor]];\
[__label__ setTextAlignment:__align__];\
[__label__ setFont:__font__];\
[__superView__ addSubview:__label__];\
[__label__ setText:__text__];\
[__label__ setTextColor:[Util getColor:__color__]];\
}
//UIButton
#define _CREATE_ALLOC_BUTTON(__btn__, __frame__, __selector__)\
{\
__btn__       = _ALLOC_OBJ_WITHFRAME_(UIButton, __frame__);\
[__btn__ addTarget:self action:__selector__ forControlEvents:UIControlEventTouchUpInside];\
}

#define _CREATE_BUTTON(__btn__, __frame__, __title__, __titlefontsize__, __selector__)\
{\
__btn__       = [UIButton buttonWithType:UIButtonTypeCustom];\
__btn__.frame = __frame__;\
[__btn__ addTarget:self action:__selector__ forControlEvents:UIControlEventTouchUpInside];\
[__btn__ setTitle:__title__ forState:UIControlStateNormal];\
[__btn__.titleLabel setFont:FONT_TITLE(__titlefontsize__)];\
}

#ifndef _SETDEFAULT_VIEW_STYLE_
#define _SETDEFAULT_VIEW_STYLE_(__view, __borderColor, __radius)\
if([__view isKindOfClass:[UIView class]])\
{\
__view.layer.cornerRadius  = __radius;\
__view.layer.borderWidth   = 1.0f;\
__view.layer.masksToBounds = YES;\
__view.layer.borderColor   = __borderColor.CGColor;\
}
#endif

#define _SIMPLE_ALERT_(__title, __message, __btnTitle)\
{\
UIAlertView* __alert__ = [[UIAlertView alloc] initWithTitle:__title message:__message delegate:nil cancelButtonTitle:__btnTitle otherButtonTitles:nil,nil];\
[__alert__ show];\
}

#endif /* PublicDefine_h */
