//
//  Module_Protocol_Account.h
//  XNHuicui
//
//  Created by xiaoniu on 2018/10/11.
//  Copyright © 2018 xiaoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - create_AccountVC 方法参数
const static NSString *kParam_AccountModule_AccountVC_OrderId = @"orderId";
const static NSString *kParam_AccountModule_AccountVC_userId = @"userId";

@protocol Module_Protocol_Account <NSObject>

- (UIViewController *)create_AccountVC:(NSDictionary *)paramDic;

@end


