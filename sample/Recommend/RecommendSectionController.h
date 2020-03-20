//
//  RecommendSectionController.h
//  sample
//
//  Created by ysnows on 2020/3/20.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "IGListSectionController.h"

@class Video;

NS_ASSUME_NONNULL_BEGIN
@interface RecommendSectionController : IGListSectionController

-(instancetype)initWithVideo:(Video *) video;

@end

NS_ASSUME_NONNULL_END
