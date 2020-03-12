//
//  VideoItem.h
//  sample
//
//  Created by ysnows on 2020/3/11.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Video;

@interface VideoListCell : UICollectionViewCell

-(void)setVideo:(Video *) video;

@end

NS_ASSUME_NONNULL_END
