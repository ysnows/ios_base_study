//
//  Macro.h
//  BlueHouse
//
//  Created by ikey on 2019/10/28.
//  Copyright © 2019 QuanSu. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

// 包裹HTML,适应屏幕
// //    resultStr = [NSString stringWithFormat:@"<html>%@<body>%@</body></html>",head,HTML];
#define HTMLString(HTML) \
({ \
    NSString *head=@"<head> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\"><style> img{max-width: 100%; height:auto !important;} body{ background-color: #ffffff;font-size:large;padding: 0 10px;}</style></head>"; \
    NSString *resultStr; \
    resultStr = [NSString stringWithFormat:@"<!DOCTYPE html> %@ <body> %@ </body> </html>",head,HTML]; \
    (resultStr); \
})

// window
#define KWINDOW [UIApplication sharedApplication].keyWindow

// 根视图控制器
#define ROOTVC KWINDOW.rootViewController

// 当前导航栏控制器
#define CURRENT_NAV \
({ \
    RDVTabBarController *rootVc = (RDVTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;\
    CustomNavigationController *currentNav = (CustomNavigationController*)rootVc;\
    (currentNav);\
})

// APPDelegate
#define APPDELEGATE (AppDelegate *)[UIApplication sharedApplication].delegate

#define ParaOfIOS_URL(URL) \
({ \
    NSRange range = [URL rangeOfString:@"?"];\
    NSString *propertys = [URL substringFromIndex:(int)(range.location+1)];\
    NSArray *subArray = [propertys componentsSeparatedByString:@"&"];\
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithCapacity:4];\
    for (int j = 0 ; j < subArray.count; j++) { \
        NSArray *dicArray = [subArray[j] componentsSeparatedByString:@"="];\
        [tempDic setObject:dicArray[1] forKey:dicArray[0]];\
    }\
    (tempDic);\
})
#define GetClassName(URL) \
({\
    NSRange range = [URL rangeOfString:@"?"];\
    NSString *className = [URL substringToIndex:(int)(range.location)];\
    (className);\
})

#define RealmPathURL(realmName) \
({\
NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];\
NSString *realmPath = [NSString stringWithFormat:@"%@/%@.realm",path,realmName];\
([NSURL URLWithString:realmPath ]);\
})

#define kScreenW ([[UIScreen mainScreen]bounds].size.width)
#define kScreenH ([[UIScreen mainScreen]bounds].size.height)
#define kNumFrom375(a) ((kScreenW*(a))/375.00)

#define keyBoardHeight ([[UIScreen mainScreen]bounds].size.height)

#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || !str || [str isEqualToString:@"<null>"] ||[str isEqualToString:@"(null)"] || str.length < 1)

#define PHOTO_WIDTH (SCREEN_WIDTH - 156) / 3
//顶部工具条的高度
#define topBarH   TextViewH - 10
//输入框的宽度
#define TextViewW kScreenW - (kScreenW * 55 / 320)


#define keyBoardH (4 * kScreenW * 0.0875 +(3 + 1) * ((kScreenW - 7 * kScreenW * 0.0875 ) / 8) + 20)


#define NetStatusChange @"NetStatusChange"  // 网络状态变化  可用不可用

//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

// 是否是iPhone X
#define iphoneX [DeviceTools isIphoneX]


// 下标高度  适配x  普通为:0 x:34
#define toolBarHeight [DeviceTools toolBarHeightMethod]

// 标签栏高度  适配x  普通为:49 x:49+34
#define tabBarHeight [DeviceTools tabBaritemHeight]


// 机型
#define iPhone_model [DeviceTools iphoneModel]

#define font(num) [UIFont systemFontOfSize:kNumFrom375(num)]
// 系统版本
#define iPhone_verson [[UIDevice currentDevice] systemVersion]

// 导航栏高度
#define navHeight [DeviceTools navBarHeight]


// 状态栏高度
#define statusHeight [DeviceTools statusBarHeight]

// rgb颜色转换（16进制->10进制）
#define COLOR_RGB(rgbValue,a) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00)>>8))/255.0 blue: ((float)((rgbValue) & 0xFF))/255.0 alpha:(a)]


// 字体
#define SYSTEM_BOLD_FONT(S)  [UIFont boldSystemFontOfSize:kNumFrom375(S)]
#define SYSTEM_FONT(S)       [UIFont systemFontOfSize:kNumFrom375(S)]
#define CUSTOM_BOLDFONT(S)   [UIFont boldSystemFontOfSize:kNumFrom375(S)]
#define CUSTOM_FONT(S)       [UIFont systemFontOfSize:kNumFrom375(S)]


#define DELETELISTTHING(KEY) [[NSUserDefaults standardUserDefaults] removeObjectForKey:KEY];
#define SEEKPLISTTHING(KEY)     [[NSUserDefaults standardUserDefaults]objectForKey:KEY]
#define DEPOSITLISTTHING(VALUE,KEY)  \
[[NSUserDefaults standardUserDefaults] setObject:VALUE forKey:KEY];\
[[NSUserDefaults standardUserDefaults] synchronize];

#define REMOVELISTTHING(KEY) [[NSUserDefaults standardUserDefaults] removeObjectForKey:KEY];
#define USERDEFAULTS [NSUserDefaults standardUserDefaults]


// 判断字段时候为空的情况
#define IF_NULL_TO_STRING(x) kStringIsEmpty? @"":x


//定义UIImage对象

#define ImageNamed(name) [UIImage imageNamed:name]

#define ResignAllResponder [[UIApplication sharedApplication].keyWindow endEditing:YES];


// 设置log可以打印出类名,方法名,行数.

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif
//DEBUG  模式下打印日志,当前行
#define DEBUGLOG 1
#if DEBUGLOG
#   define DLog(fmt, ...) { NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ALog(fmt, ...) { NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);};
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ALog(...)
#   define ELog(err)
#endif

// assert
#ifdef ENABLE_ASSERT_STOP
#define APP_ASSERT_STOP                     {LogRed(@"APP_ASSERT_STOP"); NSAssert1(NO, @" \n\n\n===== APP Assert. =====\n%s\n\n\n", __PRETTY_FUNCTION__);}
#define APP_ASSERT(condition)               {NSAssert(condition, @" ! Assert");}
#else
#define APP_ASSERT_STOP                     do {} while (0);
#define APP_ASSERT(condition)               do {} while (0);
#endif

#define UserDefaults                        [NSUserDefaults standardUserDefaults]
#define SharedApplication                   [UIApplication sharedApplication]
#define Bundle                              [NSBundle mainBundle]
#define MainScreen                          [UIScreen mainScreen]
#define ShowNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
#define NetworkActivityIndicatorVisible(x)  [UIApplication sharedApplication].networkActivityIndicatorVisible = x

#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height

#define RectX(f)                            f.origin.x
#define RectY(f)                            f.origin.y
#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height
#define RectSetWidth(f, w)                  CGRectMake(RectX(f), RectY(f), w, RectHeight(f))
#define RectSetHeight(f, h)                 CGRectMake(RectX(f), RectY(f), RectWidth(f), h)
#define RectSetX(f, x)                      CGRectMake(x, RectY(f), RectWidth(f), RectHeight(f))
#define RectSetY(f, y)                      CGRectMake(RectX(f), y, RectWidth(f), RectHeight(f))
#define RectSetSize(f, w, h)                CGRectMake(RectX(f), RectY(f), w, h)
#define RectSetOrigin(f, x, y)              CGRectMake(x, y, RectWidth(f), RectHeight(f))
#define Rect(x, y, w, h)                    CGRectMake(x, y, w, h)
#define Size(w, h)                          CGSizeMake(w, h)
#define Point(x, y)                         CGPointMake(x, y)

#define DATE_COMPONENTS                     NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
#define TIME_COMPONENTS                     NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit
#define FlushPool(p)                        [p drain]; p = [[NSAutoreleasePool alloc] init]
#define RGB(r, g, b)                        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define StatusBarHeight                     [UIApplication sharedApplication].statusBarFrame.size.height

#define IOSVersion                          [[[UIDevice currentDevice] systemVersion] floatValue]




//获取手机屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//获取App名称
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
//获取App编译版本号
#define APP_BUILDVERSION   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
//获取App发布版本号
#define APP_RELEASEVERSION  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define ColorFromHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define THEME_COLOR ColorFromHex(0x09A4FF)
#define ClearColor [UIColor clearColor]



//释放内存
#define RELEASE_SAFE(_Pointer) do{[_Pointer release],_Pointer = nil;}while(0)

#define JsonToDic(json) [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:nil]

#endif /* Macro_h */
