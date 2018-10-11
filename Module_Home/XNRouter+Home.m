//
//  XNRouter+Home.m
//  XNHuicui
//
//  Created by xiaoniu on 2018/10/11.
//  Copyright © 2018 xiaoniu. All rights reserved.
//

#import "XNRouter+Home.h"
#import "XNLHomeVC.h"

@implementation XNRouter (Home)

- (UIViewController *)create_homeVC:(NSDictionary *)paramDic {
    
    XNLHomeVM *homeVM = [[XNLHomeVM alloc] init];
    XNLHomeVC *homeVC = [[XNLHomeVC alloc] initWithVM:homeVM];
    return homeVC;
}

@end
