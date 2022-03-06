//
//  RSSParser.h
//  RSS Reader
//
//  Created by Albert Zhloba on 4.03.22.
//

#import <Foundation/Foundation.h>
#import "NewsItem.h"

@protocol RSSParserProtocol <NSObject>
- (void) parseDataWithCompletion:(NSData *)data completionHandler:(void(^)(NSArray<NewsItem *> *newsItems, NSError * error))completion;
@end

@interface RSSParser : NSObject <RSSParserProtocol, NSXMLParserDelegate>

@end

