//
//  RecommendSectionController.m
//  sample
//
//  Created by ysnows on 2020/3/20.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "RecommendSectionController.h"
#import "VideoListCell.h"
#import "YUIScreen.h"
#import "Video.h"
#import "RecommendViewController.h"


@interface RecommendSectionController ()
@property(nonatomic, strong) Video *video;

@end

@implementation RecommendSectionController

-(instancetype)initWithVideo:(Video *)video
{
    self = [super init];
    if (self) {
        _video=video;
    }
    return self;
}


- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    return  CGSizeMake(SCREEN_WIDTH, UI(250));
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
  VideoListCell *cell =  [self.collectionContext dequeueReusableCellOfClass:[VideoListCell class] forSectionController:self atIndex:index];

   [cell setVideo:self->_video];
    return cell;
}

- (void)didUpdateToObject:(id)object{
    if (object&&[object isKindOfClass:[Video class]]) {
        self->_video=object;
    }
}

@end
