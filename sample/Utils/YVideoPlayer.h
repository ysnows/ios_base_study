//
//  YVideoPlayer.h
//  sample
//
//  Created by ysnows on 2020/3/12.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YVideoPlayer : NSObject


+ (YVideoPlayer *)sharedInstance ;

-(void)playWithVideoUrl:(NSString *) videoUrl onView:(UIView *) view;

-(void)stopPlay;

@end

NS_ASSUME_NONNULL_END
