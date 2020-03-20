//
//  Video.m
//  sample
//
//  Created by ysnows on 2020/3/11.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "Video.h"

@implementation Video


- (nonnull id<NSObject>)diffIdentifier {
    return _video_url;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return ((Video*)object).video_url == _video_url;
}

@end
