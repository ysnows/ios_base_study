//
//  YMediator.m
//  sample
//
//  Created by ysnows on 2020/3/17.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "YMediator.h"

@implementation YMediator

+ (UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl{
    
    Class detailCls = NSClassFromString(@"NewsDetailViewController");
    UIViewController *detailController= [[detailCls alloc]  performSelector:NSSelectorFromString(@"initWithUrl:") withObject:detailUrl];

    return detailController;
}


+(NSMutableDictionary *)mediatorRouter{
    static NSMutableDictionary *params;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        params=@{}.mutableCopy;
    });
    
    return params;
}

+ (void)registerForScheme:(NSString *)scheme withBlock:(RouterBlock)block{
    if (scheme&&block) {
        [[[self class] mediatorRouter] setObject:block forKey:scheme];
    }
}

+ (void)openUrl:(NSString *)url withParams:(NSDictionary *)params{
   RouterBlock block =  [[[self class]mediatorRouter] objectForKey:url];
   block(params);
}


+ (void)registerProtocal:(Protocol *)proto forClass:(Class)class{
    if (proto&&class) {
        [[[self class]mediatorRouter] setObject:class forKey:NSStringFromProtocol(proto)];
    }
}

+ (Class)getClassFromProtocal:(Protocol *)proto{
    return [[[self class]mediatorRouter]objectForKey:NSStringFromProtocol(proto)];
}

@end
