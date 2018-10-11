//
//  XNRouter.h
//  XNHuicui
//
//  Created by xiaoniu on 2018/10/11.
//  Copyright © 2018 xiaoniu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XNModuleProtocols.h"


@interface XNRouter : NSObject

AS_SINGLETON(XNRouter);

//注册路由path
- (void)registerRouter:(NSString *)path sel:(SEL)sel;

//删除路由path
- (void)unregisterRouter:(NSString *)path;


//创建url对应的VC
- (UIViewController *)viewControllerForURL:(NSString *)urlStr;

//打开url
- (void)openURL:(NSString *)url;


@end


