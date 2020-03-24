//
//  LFReminderTool.m
//  AntMarket
//
//  Created by LF on 2017/3/30.
//  Copyright © 2017年 LF. All rights reserved.
//

#import "HUDTool.h"

@implementation HUDTool

+ (void)showWithStatus:(NSString *)status
{
    [super showWithStatus:status];
}



#pragma mark - Block
+ (void)load{
//    [LFReminderTool setDefaultStyle:SVProgressHUDStyleDark];
//    [LFReminderTool setMinimumDismissTimeInterval:1.5f];
//    [LFReminderTool setBackgroundColor:RGBA(0, 0, 0, 0.8)];
//    [LFReminderTool setForegroundColor:[UIColor whiteColor]];
//    [LFReminderTool setDefaultMaskType:SVProgressHUDMaskTypeGradient];
//    [LFReminderTool setInfoImage:nil];
}

void ShowHUD(void) {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [HUDTool show];
        });
    } else {
        [HUDTool show];
    }
}

void ShowSuccessStatus(NSString *statues){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [HUDTool showSuccessWithStatus:statues];
        });
    }else{
        [HUDTool showSuccessWithStatus:statues];
    }
}


void ShowMessage(NSString *statues){
  
    
  if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {
               // do something in main thread
               NSLog(@"--main thread");
       [HUDTool showInfoWithStatus:statues];
           } else {
               // do something in other thread
               NSLog(@"--other thread");
                [HUDTool showInfoWithStatus:statues];
           }
//    if (![NSThread isMainThread]) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//           [LFReminderTool showInfoWithStatus:statues];
//        });
//    }else{
//       [LFReminderTool showInfoWithStatus:statues];
//    }
}

void ShowErrorStatus(NSError *error){
    NSString *statues;
    if (error.code == CUSTOM_ERROR_CODE) {
        statues = error.localizedDescription;
    } else {
        if (error.code == -1001) {
            statues = @"连接超时";
        } else {
            statues = NetError;
        }
    }
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [HUDTool showErrorWithStatus:statues];

        });
    }else{
        [HUDTool showErrorWithStatus:statues];
    }
}

void ShowMaskStatus(NSString *statues){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [HUDTool showWithStatus:statues];
        });
    }else{
        [HUDTool showWithStatus:statues];
    }
}

void ShowProgress(CGFloat progress){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [HUDTool showProgress:progress];
        });
    }else{
        [HUDTool showProgress:progress];
    }
}

void DismissHud(void){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [HUDTool dismiss];
        });
    }else{
        [HUDTool dismiss];
    }
}

@end
