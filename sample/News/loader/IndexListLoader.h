//
//  IndexListLoader.h
//  sample
//
//  Created by ysnows on 2020/2/22.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewsItem;

NS_ASSUME_NONNULL_BEGIN

typedef void(^DataBlock)(BOOL success,NSArray<NewsItem *> *data);

@interface IndexListLoader : NSObject

-(void)loadListDataWitBlock:(DataBlock) finishBlock;

@end

NS_ASSUME_NONNULL_END
