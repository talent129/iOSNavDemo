//
//  InterfaceDefine.h
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/4.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#ifndef InterfaceDefine_h
#define InterfaceDefine_h

/* 服务器地址-开发环境 */
#define SERVER_HOST @"http://www.kuaidi100.com"

///* 服务器地址-正式环境 */
//#define SERVER_HOST @"http://www.kuaidi100.com"

/* App Store地址 */
#define UPDATE_ADDRESS @"https://itunes.apple.com/cn/app/---"

#pragma mark -接口部分 接口名称

/* 接口-测试 */
static NSString *const kSearchExpress = @"query";


/* 登录 */
static NSString *const kLogin = @"";
/* 注册 */
static NSString *const kRegister = @"";
/* 忘记密码 */
static NSString *const kForgetPwd = @"";


/* RSA 加密公钥 */
#define RSAPUBLICKEY    @"---"

#endif /* InterfaceDefine_h */
