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



@interface AppDelegate ()

@end
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.


    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor=[UIColor whiteColor];

    UITabBarController *tabbarController=[[UITabBarController alloc]init];
    
    NewsViewController *controller1=[[NewsViewController alloc]init];
    VideoViewController *controller2=[[VideoViewController alloc]init];
    RecommendViewController *controller3=[[RecommendViewController alloc]init];
    MineViewController *controller4=[[MineViewController alloc]init];

    [tabbarController setViewControllers:@[controller1,controller2,controller3,controller4]];
    UINavigationController *navigationController=[[UINavigationController alloc]initWithRootViewController:tabbarController];
    
    self.window.rootViewController=navigationController;
    [self.window makeKeyAndVisible];
    
    [self.window addSubview:[[SplashView alloc]initWithFrame:self.window.bounds]];
    
    [[YLocation sharedInstance]checkLocation];
    [[YNotification sharedInstance]checkNotificationAuthorization];

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

@end
