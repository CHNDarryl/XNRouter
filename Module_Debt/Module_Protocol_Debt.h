//
//  Module_Protocol_Debt.h
//  XNHuicui
//
//  Created by xiaoniu on 2018/10/11.
//  Copyright © 2018 xiaoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Module_Protocol_Debt <NSObject>

- (UIViewController *)create_DebtListVC:(NSDictionary *)paramDic;
- (UIViewController *)create_DebtDetailVC:(NSDictionary *)paramDic;

@end

