//
//  XNRouter+Debt.m
//  XNHuicui
//
//  Created by xiaoniu on 2018/10/11.
//  Copyright © 2018 xiaoniu. All rights reserved.
//

#import "XNRouter+Debt.h"

#import "XNLDebtListVC.h"
#import "XNLDebtDetailVC.h"

@implementation XNRouter (Debt)

- (UIViewController *)create_DebtListVC:(NSDictionary *)paramDic {
    
    //1. 取参数，校验参数

    //2. 创建VM,VC
    XNLDebtListVM *debtVM = [[XNLDebtListVM alloc] init];
    XNLDebtListVC *debtVC = [[XNLDebtListVC alloc] initWithVM:debtVM];
    return debtVC;
}

- (UIViewController *)create_DebtDetailVC:(NSDictionary *)paramDic {
    
    //1. 取参数，校验参数
    
    //2. 创建VM,VC
    XNLDebtDetailVM *vm = [[XNLDebtDetailVM alloc] initWithDebtDetail:nil];
    XNLDebtDetailVC *vc = [[XNLDebtDetailVC alloc] initWithVM:vm];
    return vc;
}


@end
