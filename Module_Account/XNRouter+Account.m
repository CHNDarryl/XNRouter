//
//  XNRouter+Account.m
//  XNHuicui
//
//  Created by xiaoniu on 2018/10/11.
//  Copyright © 2018 xiaoniu. All rights reserved.
//

#import "XNRouter+Account.h"
#import "XNLAccountVC.h"

@implementation XNRouter (Account)

- (UIViewController *)create_AccountVC:(NSDictionary *)paramDic {
    
    //1. 取参数，并校验参数
    NSString *orderId = paramDic[kParam_AccountModule_AccountVC_OrderId];
    NSString *userId = paramDic[kParam_AccountModule_AccountVC_userId];
    
    //2. 创建VM->VC
    XNLAccountVM *accountVM = [[XNLAccountVM alloc] init];
    XNLAccountVC *accountVC = [[XNLAccountVC alloc] initWithVM:accountVM];
    return accountVC;
    
}

@end
