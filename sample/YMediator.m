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


@end
