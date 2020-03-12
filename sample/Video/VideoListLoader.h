//
//  VideoListLoader.h
//  sample
//
//  Created by ysnows on 2020/3/12.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Video;

typedef void (^VideoLoadComplete)(NSArray<Video *> * _Nonnull videoArr);

NS_ASSUME_NONNULL_BEGIN

@interface VideoListLoader : NSObject

-(void)loadVideoListWithCompleted: (VideoLoadComplete) videoComplete;

@end

NS_ASSUME_NONNULL_END
