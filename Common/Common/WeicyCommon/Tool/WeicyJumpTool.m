//
//  WeicyJumpTool.m
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import "WeicyJumpTool.h"

@implementation WeicyJumpTool

+ (UIViewController *)weicy_getCurrentVC {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        
        for (UIWindow *tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    
    UIViewController *viewController = window.rootViewController;
    UIViewController *currentVC = nil;
    while (viewController) {
        currentVC = viewController;
        //控制器
        if ([viewController isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tempVC = (UITabBarController *)viewController;
            viewController = tempVC.selectedViewController;
        }else if ([viewController isKindOfClass:[UINavigationController class]]){
            UINavigationController *tempVC = (UINavigationController *)viewController;
            viewController = [tempVC.viewControllers lastObject];
        }else{
            viewController = viewController.presentedViewController;
        }
    }
    
    return currentVC;
}

+ (void)weicy_jumpToVC:(NSString *)vcName param:(NSDictionary *)param {
    UIViewController *visibleVC = [self weicy_getCurrentVC];
    //需要跳转的页面的一些处理（比如传参...）
    UIViewController *toVC = [[NSClassFromString(vcName) alloc]init];
    if (param) {
        for (NSString *key in param.allKeys) {
            [toVC setValue:param[key] forKey:key];
        }
    }
    if (visibleVC.navigationController) {
        [visibleVC.navigationController pushViewController:toVC animated:YES];
    } else {
        [visibleVC presentViewController:toVC animated:YES completion:nil];
    }
}

@end
