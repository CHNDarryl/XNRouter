//
//  UIViewController+Visible.m
//  XNHuicui
//
//  Created by xiaoniu on 2018/10/11.
//  Copyright © 2018 xiaoniu. All rights reserved.
//

#import "UIViewController+Visible.h"

@implementation UIViewController (Visible)

//当前可见的VC
+ (UIViewController *)xn_visibleViewController {
    
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    UIViewController *visibleViewController = [rootViewController xn_visibleViewControllerIfExist];
    return visibleViewController;
}


//遍历查找当前可见的VC
- (UIViewController *)xn_visibleViewControllerIfExist {
    
    if (self.presentedViewController) {
        return [self.presentedViewController xn_visibleViewControllerIfExist];
    }
    
    if ([self isKindOfClass:[UINavigationController class]]) {
        return [((UINavigationController *)self).topViewController xn_visibleViewControllerIfExist];
    }
    
    if ([self isKindOfClass:[UITabBarController class]]) {
        return [((UITabBarController *)self).selectedViewController xn_visibleViewControllerIfExist];
    }
    
    if ([self isViewLoaded] && self.view.window) {
        return self;
    } else {
        NSLog(@"visibleViewControllerIfExist:，找不到可见的viewController。self = %@, self.view.window = %@", self, self.view.window);
        return nil;
    }
}


@end
