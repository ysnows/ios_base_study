//
//  YMediator.h
//  sample
//
//  Created by ysnows on 2020/3/17.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NewsDetailProtocal <NSObject>
    -(UIViewController *)detailViewControllerWithUrl:(NSString *)url;
@end



@interface YMediator : NSObject

+(__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;


typedef void (^RouterBlock)(NSDictionary *params);
+(void)registerForScheme:(NSString *)scheme withBlock:(RouterBlock) block;
+(void)openUrl:(NSString *)url withParams:(NSDictionary *)params;


+(void)registerProtocal:(Protocol*) proto forClass:(Class) class;
+(Class)getClassFromProtocal:(Protocol*) proto;

@end

NS_ASSUME_NONNULL_END
