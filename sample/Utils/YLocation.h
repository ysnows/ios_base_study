//
//  YLocation.h
//  sample
//
//  Created by ysnows on 2020/3/19.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLocation : NSObject


+ (instancetype)sharedInstance;


-(void)checkLocation;

@end

NS_ASSUME_NONNULL_END
