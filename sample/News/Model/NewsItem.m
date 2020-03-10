//
//	NewsItem.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "NewsItem.h"

NSString *const kNewsItemAuthorName = @"author_name";
NSString *const kNewsItemCategory = @"category";
NSString *const kNewsItemDate = @"date";
NSString *const kNewsItemThumbnailPicS = @"thumbnail_pic_s";
NSString *const kNewsItemThumbnailPicS02 = @"thumbnail_pic_s02";
NSString *const kNewsItemThumbnailPicS03 = @"thumbnail_pic_s03";
NSString *const kNewsItemTitle = @"title";
NSString *const kNewsItemUniquekey = @"uniquekey";
NSString *const kNewsItemUrl = @"url";

@interface NewsItem ()<NSSecureCoding>

- (void)encodeWithCoder:(NSCoder *)coder;
- (nullable instancetype)initWithCoder:(NSCoder *)coder; // NS_DESIGNATED_INITIALIZER

@end

@implementation NewsItem

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.title=[coder decodeObjectForKey:@"title"];
        self.category=[coder decodeObjectForKey:@"category"];
        self.url=[coder decodeObjectForKey:@"url"];
        self.authorName=[coder decodeObjectForKey:@"authorName"];
        self.uniquekey=[coder decodeObjectForKey:@"uniquekey"];
        self.date=[coder decodeObjectForKey:@"date"];
        self.thumbnailPicS=[coder decodeObjectForKey:@"thumbnailPicS"];
        self.thumbnailPicS02=[coder decodeObjectForKey:@"thumbnailPicS02"];
        self.thumbnailPicS03=[coder decodeObjectForKey:@"thumbnailPicS03"];
    }
    
    return self;
}


- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.url forKey:@"url"];
    [coder encodeObject:self.authorName forKey:@"authorName"];
    [coder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.thumbnailPicS forKey:@"thumbnailPicS"];
    [coder encodeObject:self.thumbnailPicS02 forKey:@"thumbnailPicS02"];
    [coder encodeObject:self.thumbnailPicS03 forKey:@"thumbnailPicS03"];
}

+(BOOL)supportsSecureCoding{
    return YES;
}
/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kNewsItemAuthorName] isKindOfClass:[NSNull class]]){
		self.authorName = dictionary[kNewsItemAuthorName];
	}	
	if(![dictionary[kNewsItemCategory] isKindOfClass:[NSNull class]]){
		self.category = dictionary[kNewsItemCategory];
	}	
	if(![dictionary[kNewsItemDate] isKindOfClass:[NSNull class]]){
		self.date = dictionary[kNewsItemDate];
	}	
	if(![dictionary[kNewsItemThumbnailPicS] isKindOfClass:[NSNull class]]){
		self.thumbnailPicS = dictionary[kNewsItemThumbnailPicS];
	}	
	if(![dictionary[kNewsItemThumbnailPicS02] isKindOfClass:[NSNull class]]){
		self.thumbnailPicS02 = dictionary[kNewsItemThumbnailPicS02];
	}	
	if(![dictionary[kNewsItemThumbnailPicS03] isKindOfClass:[NSNull class]]){
		self.thumbnailPicS03 = dictionary[kNewsItemThumbnailPicS03];
	}	
	if(![dictionary[kNewsItemTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kNewsItemTitle];
	}	
	if(![dictionary[kNewsItemUniquekey] isKindOfClass:[NSNull class]]){
		self.uniquekey = dictionary[kNewsItemUniquekey];
	}	
	if(![dictionary[kNewsItemUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kNewsItemUrl];
	}	
	return self;
}
@end
