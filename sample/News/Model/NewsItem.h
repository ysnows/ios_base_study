#import <UIKit/UIKit.h>

@interface NewsItem : NSObject

@property (nonatomic, strong) NSString * authorName;
@property (nonatomic, strong) NSString * category;
@property (nonatomic, strong) NSString * date;
@property (nonatomic, strong) NSString * thumbnailPicS;
@property (nonatomic, strong) NSString * thumbnailPicS02;
@property (nonatomic, strong) NSString * thumbnailPicS03;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * uniquekey;
@property (nonatomic, strong) NSString * url;



-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
