//
//  VideoListLoader.m
//  sample
//
//  Created by ysnows on 2020/3/12.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "VideoListLoader.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "Video.h"

@implementation VideoListLoader

-(void)loadVideoListWithCompleted:(VideoLoadComplete)videoComplete{
    
      [[AFHTTPSessionManager manager] GET:@"https://quansu-webapp.oss-cn-qingdao.aliyuncs.com/ios/videos.json" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           NSArray *videoList= [Video mj_objectArrayWithKeyValuesArray:responseObject];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (videoComplete) {
                    videoComplete(videoList);
                }
            });

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
}

@end
