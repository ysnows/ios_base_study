//
//  QQLogin.h
//  sample
//
//  Created by ysnows on 2020/3/18.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^LoginSuccessBlock)(NSDictionary *userInfo,BOOL success);
@interface QQLogin : NSObject


+ (instancetype)sharedInstance;

-(void)loginWithSuccessBlock:(LoginSuccessBlock) loginBlock;


@end

NS_ASSUME_NONNULL_END
