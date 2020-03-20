//
//  YCommentBar.h
//  sample
//
//  Created by ysnows on 2020/3/20.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCommentBar : NSObject

+ (instancetype)sharedInstance;
-(void)showCommentView;

@end

NS_ASSUME_NONNULL_END
