//
//  IndexListLoader.m
//  sample
//
//  Created by ysnows on 2020/2/22.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "IndexListLoader.h"
#import "AFNetworking.h"

#import "NewsItem.h"

@implementation IndexListLoader

- (void)loadListDataWitBlock:(DataBlock)finishBlock{

    NSArray<NewsItem *> *items=[self _getLocalData];
    
    if (items!=nil) {
        if (finishBlock) {
            finishBlock(YES,items.copy);
        }
    }
    
    
    NSString *urlString=@"https://quansu-webapp.oss-cn-qingdao.aliyuncs.com/test.json";
//    NSString *urlString=@"http://v.juhe.cn/toutiao/index?type=top&key=ddfb2b8ecb24486c0afb8c79ac43f4b9";
    NSURL *url=[NSURL URLWithString:urlString];
//    NSURLRequest *request=[NSURLRequest requestWithURL:url];

    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionTask *task=[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *err;
        id jsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:&err];

        NSArray *dataArr=[(NSDictionary *) [(NSDictionary *)jsonObject objectForKey:@"result"] objectForKey:@"data"];

        NSMutableArray *listItem=@[].mutableCopy;

        for (NSDictionary *item in dataArr) {
            NewsItem *newsItem=[[NewsItem alloc]initWithDictionary:item];
            [listItem addObject:newsItem];
        }

        [self _getSandBoxPath:listItem];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error==nil,listItem.copy);
            }
        });

    }];
    [task resume];
    
}


-(NSArray<NewsItem *> *)_getLocalData{
        NSError *err;
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    NSArray *arr=  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath=[arr firstObject];

    NSString *listDataPath=[cachePath stringByAppendingPathComponent:@"listdir/listData"];
    NSData *contentOfFile=[fileManager contentsAtPath:listDataPath];

    id objectFromCoding= [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[NewsItem class], nil] fromData:contentOfFile error:&err];

    if ([objectFromCoding isKindOfClass:[NSArray class]]&&[objectFromCoding count]>0) {
        return (NSArray<NewsItem*>*)objectFromCoding;
    }
    return nil;
}

-(void)_getSandBoxPath:(NSArray<NewsItem *> *) array{
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    NSArray *arr=  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath=[arr firstObject];

    NSString *listDataPath=[cachePath stringByAppendingPathComponent:@"listdir"];
    NSError *dirErr;
    BOOL created=[fileManager createDirectoryAtPath:listDataPath withIntermediateDirectories:NO attributes:nil error:&dirErr];
    NSString *listDataFile=[listDataPath stringByAppendingPathComponent:@"listData"];
    
    NSData *data= [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];

    [fileManager createFileAtPath:listDataFile contents:data attributes:nil];

    
//    BOOL listDataExist=[fileManager fileExistsAtPath:listDataPath];
//
//    if (listDataExist) {
////        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
//
//
//    NSUserDefaults *userDefault= [NSUserDefaults standardUserDefaults];
//    NSData *data= [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
//    [userDefault setObject:data forKey:@"test"];
//

//    NSFileHandle *fileHandle=[NSFileHandle fileHandleForUpdatingAtPath:listDataFile];
//    [fileHandle seekToEndOfFile];
//    [fileHandle writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];

//    [fileHandle synchronizeFile];
//    [fileHandle closeFile];
    

//    id obj=[userDefault objectForKey:@"listData"];
    
    

//    NSData *contentOfFile=[fileManager contentsAtPath:listDataFile];
//    NSData *contentOfFile=[userDefault dataForKey:@"test"];
////
//    NSError *err;
//    id objectFromCoding= [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[NewsItem class], nil] fromData:contentOfFile error:&err];
////
//    NSLog(@"Hello");
}

@end
