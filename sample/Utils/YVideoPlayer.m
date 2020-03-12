//
//  YVideoPlayer.m
//  sample
//
//  Created by ysnows on 2020/3/12.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "YVideoPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface YVideoPlayer ()

@property(nonatomic, strong) AVPlayerItem *playItem;
@property(nonatomic, strong) AVPlayer *videoPlayer;
@property(nonatomic, strong) AVPlayerLayer *videoLayer;
@property(nonatomic, assign) Float64 video_duration;
@property(nonatomic, strong) NSString *pre_video_url;

@end


@implementation YVideoPlayer


+ (YVideoPlayer *)sharedInstance {
    static dispatch_once_t onceToken;
    static YVideoPlayer *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });

    return instance;
}


+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

- (void)playWithVideoUrl:(NSString *)videoUrl onView:(UIView *)view{
    
    if ([_pre_video_url isEqualToString:videoUrl]) {
        if(_videoPlayer.rate==0){
            [_videoPlayer play];
        }else{
            [_videoPlayer pause];
        }
        return;
    }
    
    _pre_video_url=videoUrl;

    [self stopPlay];

    AVAsset *asset=[AVAsset assetWithURL:[NSURL URLWithString:videoUrl]];
    _playItem=[AVPlayerItem playerItemWithAsset:asset];
    _videoPlayer=[AVPlayer playerWithPlayerItem:_playItem];
    _videoLayer = [AVPlayerLayer playerLayerWithPlayer:_videoPlayer];
    _videoLayer.frame=view.bounds;
    
    [_videoPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
       Float64 progress = CMTimeGetSeconds(time);
        NSLog(@"progress is %f",progress);
        
    }];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(videoToEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [_playItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];

    [view.layer addSublayer:_videoLayer];

}


-(void)videoToEnd{
    [self stopPlay];
}

- (void)pause{
    
    [_videoPlayer pause];
}


- (void)resume{
    [_videoPlayer play];
}


- (void)stopPlay{
    
    [_videoLayer removeFromSuperlayer];
    _videoLayer=nil;
    _videoPlayer=nil;
    _playItem= nil;
    

    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [_playItem removeObserver:self forKeyPath:@"status"];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqual:@"status"]) {
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
           _video_duration=CMTimeGetSeconds(_playItem.duration);
            NSLog(@"video_duration:%f",_video_duration);
            [_videoPlayer play];
        }
    }
}


@end
