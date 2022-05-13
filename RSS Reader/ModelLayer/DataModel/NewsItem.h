//
//  NewsItem.h
//  RSS Reader
//
//  Created by Albert Zhloba on 4.03.22.
//

#import <Foundation/Foundation.h>

@interface NewsItem : NSObject

@property(nonatomic, copy) NSString *newsTitle;
@property(nonatomic, copy) NSString *newsDescription;
@property(nonatomic, copy) NSString *newsLink;
@property(nonatomic, copy) NSString *newsDate;
-(instancetype)initWithDictionary: (NSDictionary *) dictionary;
@end

