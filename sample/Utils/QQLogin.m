//
//  QQLogin.m
//  sample
//
//  Created by ysnows on 2020/3/18.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "QQLogin.h"
#import <TencentOpenAPI/TencentOAuth.h>

#import <TencentOpenAPI/QQApiInterfaceObject.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <CocoaLumberjack/CocoaLumberjack.h>


static const DDLogLevel ddLogLevel = DDLogLevelDebug;

@interface QQLogin ()<TencentSessionDelegate>

@property(nonatomic, strong) TencentOAuth *tencentOAuth;
@property(nonatomic, strong) NSArray *permissions;
@property(nonatomic, readwrite) BOOL *isLogin;
@property(nonatomic, strong) LoginSuccessBlock loginBlock;


@end

@implementation QQLogin

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static QQLogin *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tencentOAuth=[[TencentOAuth alloc]initWithAppId:@"1106325594" andDelegate:self];
        _permissions=[NSArray arrayWithObjects:@"get_user_info",@"add_share", nil];

    }
    return self;
}


- (void)loginWithSuccessBlock:(LoginSuccessBlock)loginBlock{
    _loginBlock=loginBlock;
    
    ShowHUD();
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *accessToken = [userDefault objectForKey:@"access_token"];
    NSString *openId = [userDefault objectForKey:@"open_id"];
    NSDate *expiration_date = [userDefault objectForKey:@"expiration_date"];
    NSDate *nowDate=[NSDate date];
    
    NSComparisonResult result = [nowDate compare:expiration_date];
    if (accessToken!=nil && result == NSOrderedAscending) {
        [_tencentOAuth setAccessToken:accessToken];
        [_tencentOAuth setOpenId:openId];
        [_tencentOAuth setExpirationDate:expiration_date];
        
        [_tencentOAuth getUserInfo];
        
    }else{
        [_tencentOAuth authorize:_permissions inSafari:NO];
    }
}

- (void)tencentDidLogin{
    NSLog(@"Hello");
    if (_tencentOAuth.accessToken&&0!=[_tencentOAuth.accessToken length]) {
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:_tencentOAuth.openId forKey:@"open_id"];
        [userDefault setObject:_tencentOAuth.accessToken forKey:@"access_token"];
        [userDefault setObject:_tencentOAuth.expirationDate forKey:@"expiration_date"];
        
        [_tencentOAuth getUserInfo];

    }else{
        NSLog(@"获取accessToken失败");
        DismissHud();
    }

}

- (void)tencentDidNotLogin:(BOOL)cancelled{
    
    DismissHud();
    if (cancelled) {
        NSLog(@"用户取消");
    }else{
        NSLog(@"登录失败");
    }
    
    _loginBlock(nil,NO);
}


- (void)tencentDidNotNetWork{
    
    DismissHud();
    NSLog(@"无网络连接,请设置网络!");
}

- (void)getUserInfoResponse:(APIResponse *)response{
    if (response) {
        NSDictionary *userInfo = response.jsonResponse;
        _loginBlock(userInfo,YES);
    }
    
    DismissHud();
}


- (void)shareArticle:(NSString *)url{
    
    //一定要加上这行代码 虽然官方文档并未说明 不然很可能调不起分享界面**

      TencentOAuth *auth = [[TencentOAuth alloc] initWithAppId:@"1106325594" andDelegate:self];

        NSString *title =@"shareTitleStr";

        NSString *description =@"shareDetailStr";

        NSString *previewImageUrl =@"https://upload.jianshu.io/users/upload_avatars/8532098/0eb21017-4f7a-4449-88af-b3f0ebd0d578.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/80/h/80/format/webp";

        QQApiNewsObject *newsObj = [QQApiNewsObject objectWithURL:[NSURL URLWithString:url]

                                title:title

                                description:description

                                previewImageURL:[NSURL URLWithString:previewImageUrl]];
    

        newsObj.shareDestType = ShareDestTypeQQ;
        SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:newsObj];

    //将内容分享到qq
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];

}

@end
