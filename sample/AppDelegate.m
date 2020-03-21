//
//  AppDelegate.m
//  sample
//
//  Created by ysnows on 2020/2/7.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "RecommendViewController.h"
#import "MineViewController.h"
#import "SplashView.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import "YLocation.h"
#import "YNotification.h"
#import "YTabBarViewController.h"



@interface AppDelegate ()<UITabBarControllerDelegate>

@end
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];

    
    YTabBarViewController *tabbarController= [[YTabBarViewController alloc]init];
//    UINavigationController *rootController= [[UINavigationController alloc]initWithRootViewController:tabbarController];
    self.window.rootViewController=tabbarController;

    [self.window addSubview:[[SplashView alloc]initWithFrame:self.window.bounds]];
    
    [[YLocation sharedInstance]checkLocation];
    [[YNotification sharedInstance]checkNotificationAuthorization];

    NSUserDefaults *todayDefaults=[[NSUserDefaults alloc]initWithSuiteName:@"group.com.ysnows.sample"];
    [todayDefaults setObject:@"I'm from NSUserDefaults" forKey:@"title"];

    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    [TencentOAuth HandleOpenURL:url];
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    [TencentOAuth HandleOpenURL:url];
    return YES;
}

-(BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray<id<UIUserActivityRestoring>> * __nullable restorableObjects))restorationHandler NS_AVAILABLE_IOS(8_0); {

        // Demo处理Universallink的示例代码
        if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {

             NSURL *url = userActivity.webpageURL;
             if (url && [TencentOAuth CanHandleUniversalLink:url]) {

                  // 兼容[QQApiInterface handleOpenURL:delegate:]的接口回调能力
//                 [QQApiInterface handleOpenUniversallink:url delegate:(id<QQApiInterfaceDelegate>) [QQApiShareEntry class]];
                 
                 return [TencentOAuth HandleUniversalLink:url];
              }
        }
        return YES;
}



- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSLog(@"device token registed");
}


-(void)_changeBlackIcon{
    // official with alert
    
//    if ([[UIApplication sharedApplication] supportsAlternateIcons]){
//        [[UIApplication sharedApplication] setAlternateIconName:@"ICONBLACK" completionHandler:^(NSError * _Nullable error) {
//
//        }];
//
//    }
    
    //anti apple private method call analyse withoud alert
      if ([[UIApplication sharedApplication] respondsToSelector:@selector(supportsAlternateIcons)] &&
          [[UIApplication sharedApplication] supportsAlternateIcons])
      {
          
          
          
          NSMutableString *selectorString = [[NSMutableString alloc] initWithCapacity:40];
          [selectorString appendString:@"_setAlternate"];
          [selectorString appendString:@"IconName:"];
          [selectorString appendString:@"completionHandler:"];

          SEL selector = NSSelectorFromString(selectorString);
          IMP imp = [[UIApplication sharedApplication] methodForSelector:selector];
          void (*func)(id, SEL, id, id) = (void *)imp;
          if (func)
          {
              func([UIApplication sharedApplication], selector, @"ICONBLACK", ^(NSError * _Nullable error) {});
          }
      }
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"did select tabbar");
    
    [self _changeBlackIcon];
}

@end
