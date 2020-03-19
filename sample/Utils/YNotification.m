//
//  YNotification.m
//  sample
//
//  Created by ysnows on 2020/3/19.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "YNotification.h"
#import <UserNotifications/UserNotifications.h>

@interface YNotification ()<UNUserNotificationCenterDelegate>

@end

@implementation YNotification
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static YNotification  *instance = nil;
    
    dispatch_once(&onceToken, ^{
        instance = [[super alloc] init];
    });

    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}




- (void)checkNotificationAuthorization{
    UNUserNotificationCenter *center=[UNUserNotificationCenter currentNotificationCenter];
    center.delegate=self;
    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge| UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSLog(@"%b",granted);
        if (granted) {
            [self pushLocalNotification];
        }
    }];

}


- (void)pushLocalNotification{
    
    UNMutableNotificationContent *content=[[UNMutableNotificationContent alloc]init];
    content.title=@"Hello";
    content.body=@"Hello World";
    content.badge=@(1);
    UNNotificationTrigger *trigger= [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:30.0f repeats:NO];
    UNNotificationRequest *request= [UNNotificationRequest requestWithIdentifier:@"notification" content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter]addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"add success");
    }];
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    completionHandler(UNNotificationPresentationOptionAlert|UNNotificationPresentationOptionSound);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler{
    NSLog(@"clicked");
}

@end
