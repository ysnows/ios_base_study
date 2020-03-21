//
//  VideoItem.m
//  sample
//
//  Created by ysnows on 2020/3/11.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "VideoListCell.h"
#import <SDWebImage/SDWebImage.h>
#import "Video.h"
#import "YVideoPlayer.h"
#import "VideoToolBar.h"
#import "YCommentBar.h"


@interface VideoListCell ()

@property(nonatomic, strong) UIImageView *img_cover;
@property(nonatomic, strong) UIImageView *img_btn;
@property(nonatomic, copy) Video *video;
@property(nonatomic, strong) VideoToolBar *tool_bar;

@end


@implementation VideoListCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self addSubview:({
            _img_cover= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-VIDEO_TOOLBAR_HEIGHT)];
            _img_cover;
        })];

        [_img_cover addSubview:({
            _img_btn= [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width-50)/2, (frame.size.height-50-VIDEO_TOOLBAR_HEIGHT)/2, 50, 50)];
            _img_btn.image=[UIImage imageNamed:@"videoPlay"];
            _img_btn;
        })];

        [self addSubview:({
            _tool_bar=[[VideoToolBar alloc]initWithFrame:CGRectMake(0, frame.size.height-VIDEO_TOOLBAR_HEIGHT, frame.size.width, VIDEO_TOOLBAR_HEIGHT)];
            [_tool_bar addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_commentClick)]];
            _tool_bar;
        })];


        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(videoClick)];
        [self addGestureRecognizer:tap];


    }


    return self;
}

- (void)_commentClick {
    [[YCommentBar sharedInstance] showCommentView];
}


-(void)videoClick{

    [[YVideoPlayer sharedInstance]playWithVideoUrl:_video.video_url onView:_img_cover];
}


- (void)setVideo:(Video *)video{
    _video=video;

    [_img_cover sd_setImageWithURL:[NSURL URLWithString:video.corver_url] placeholderImage:[UIImage imageNamed:@"icon.bundle/icon.png"]];

    [_tool_bar layoutWithModel:nil];
}

@end
