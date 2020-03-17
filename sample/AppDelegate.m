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

    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{

    return YES;
}


@end
