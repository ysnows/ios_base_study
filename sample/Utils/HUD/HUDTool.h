//
//  LFReminderTool.h
//  AntMarket
//
//  Created by LF on 2017/3/30.
//  Copyright © 2017年 LF. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>
#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#define Loading @"加载中..."
#define NetError @"网络连接失败!"


@interface HUDTool : SVProgressHUD


extern void ShowHUD(void);
extern void ShowSuccessStatus(NSString *statues);
extern void ShowErrorStatus(NSError *error);
extern void ShowMaskStatus(NSString *statues);
extern void ShowMessage(NSString *statues);
extern void ShowProgress(CGFloat progress);
extern void DismissHud(void);

@end
