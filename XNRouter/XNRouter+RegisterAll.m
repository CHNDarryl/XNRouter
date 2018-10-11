//
//  XNRouter+RegisterRouter.m
//  XNHuicui
//
//  Created by xiaoniu on 2018/10/11.
//  Copyright © 2018 xiaoniu. All rights reserved.
//

#import "XNRouter+RegisterAll.h"

@implementation XNRouter (RegisterAll)

- (void)registerAll {
    
    //path注册集中管理
    [self registerRouter:@"aaaa/home" sel:@selector(create_homeVC:)];
    [self registerRouter:@"bbbb/debtlist" sel:@selector(create_DebtListVC:)];
    [self registerRouter:@"cccc/account" sel:@selector(create_AccountVC:)];
    [self registerRouter:@"dddd" sel:@selector(create_DebtDetailVC:)];
}

@end
