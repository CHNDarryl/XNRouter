//
//  XNRouter.m
//  XNHuicui
//
//  Created by xiaoniu on 2018/10/11.
//  Copyright © 2018 xiaoniu. All rights reserved.
//

#import "XNRouter.h"
#import "AppDelegate.h"
#import "UIViewController+Visible.h"
#import "NSURL+SSToolkitAdditions.h"


NSString *const kWebScheme = @"http";
NSString *const kAppScheme = @"huicui";

@interface XNRouter ()

@property (nonatomic, strong) NSMutableDictionary *routeDic;

@end

@implementation XNRouter

DEF_SINGLETON(XNRouter);

/**
注册路由path
强制要求所有url格式为: scheme://xxx/xxxx/xxx?a=1&b=2
path为：url中间部分(xxx/xxxx/xxx)
*/
 
- (void)registerRouter:(NSString *)path sel:(SEL)sel {
    [self.routeDic setObject:NSStringFromSelector(sel) forKey:path];
}

//删除路由path
- (void)unregisterRouter:(NSString *)path {
    [self.routeDic removeObjectForKey:path];
}


//根据url创建VC
- (UIViewController *)viewControllerForURL:(NSString *)urlStr {
    
    UIViewController *result = nil;
    NSURL *url = [NSURL URLWithString:urlStr];
    if (!url) {
        return result;
    }
    
    NSString *scheme = url.scheme;
    if ([scheme hasPrefix:kWebScheme]) {
        //h5
        result = [self webVCForURL:url];
        
    } else if ([scheme hasPrefix:kAppScheme]) {
        //native
        NSString *path = [self pathFromUrl:urlStr];
        NSDictionary *paramDic = url.ss_queryParameters;
        result = [self nativeVCForPath:path paramDic:paramDic];
    }
    
    return result;
}


//打开
- (void)openURL:(NSString *)urlStr {
    UIViewController *destVC = [self viewControllerForURL:urlStr];
    if (destVC) {
        [self gotoVC:destVC];
    }
}

#pragma mark - Private

//原生页面
- (UIViewController *)nativeVCForPath:(NSString *)path paramDic:(NSDictionary *)paramDic {
    
    UIViewController *result = nil;
    if (path.length && self.routeDic[path]) {
        
        SEL methodSEL = NSSelectorFromString(self.routeDic[path]);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        if ([self respondsToSelector:methodSEL]) {
            result = [self performSelector:methodSEL withObject:paramDic];
        }
#pragma clang diagnostic pop
    }
    
    return result;
}


//h5页面
- (UIViewController *)webVCForURL:(NSURL *)url {
    return nil;
}


//跳转到指定VC
- (void)gotoVC:(UIViewController *)curVC {
    
    UIViewController *topVC = [UIViewController xn_visibleViewController];
    if (!topVC.navigationController) {
        
        //当前可见VC没有导航栏，则topVC设置为present本VC的上级VC.
        //不考虑多次present的场景
        topVC = topVC.presentingViewController;
    }
    [topVC.navigationController pushViewController:curVC animated:YES];
}


- (NSString *)pathFromUrl:(NSString *)urlStr {

    NSArray *itemArr = [urlStr componentsSeparatedByString:@"://"];
    if (itemArr.count != 2) {
        return nil;
    } else {
        NSString *path = itemArr[1];
        if ([path rangeOfString:@"?"].location != NSNotFound) {
            path = [path componentsSeparatedByString:@"?"][0];
        }
        return path;
    }
}



#pragma mark - Property

- (NSMutableDictionary *)routeDic {
    if (!_routeDic) {
        _routeDic = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _routeDic;
}

@end
