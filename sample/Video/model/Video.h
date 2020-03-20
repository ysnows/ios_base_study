//
//  Video.h
//  sample
//
//  Created by ysnows on 2020/3/11.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListDiffKit/IGListDiffable.h>

NS_ASSUME_NONNULL_BEGIN

@interface Video : NSObject<IGListDiffable>

@property(nonatomic, copy) NSString *corver_url;
@property(nonatomic, copy) NSString *video_url;

@end

NS_ASSUME_NONNULL_END
