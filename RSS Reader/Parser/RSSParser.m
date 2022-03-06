//
//  RSSParser.m
//  RSS Reader
//
//  Created by Albert Zhloba on 4.03.22.
//

#import "RSSParser.h"
#import "NewsItem.h"
@interface RSSParser ()

@property(nonatomic, retain) NSMutableDictionary *itemDictionary;
@property(nonatomic, retain) NSMutableString *parsedString;
@property(nonatomic, retain) NSMutableArray<NewsItem *> *items;
@property(nonatomic, weak)   void(^completion)(NSArray<NewsItem *> *newsItems, NSError * error);

@end

@implementation RSSParser

- (void) parseDataWithCompletion:(NSData *)data completionHandler:(void(^)(NSArray<NewsItem *> *newsItems, NSError * error))completion{
    self.completion = completion;
    NSXMLParser *parser = [[NSXMLParser alloc]initWithData:data];
    [parser setDelegate:self];
    [parser parse];
    [parser release];
}
- (void)parserDidStartDocument:(NSXMLParser *)parser{
    self.items = [[NSMutableArray new] autorelease];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    if([elementName isEqualToString:@"item"]){
        self.itemDictionary = [[NSMutableDictionary new] autorelease];
    } else {
        self.parsedString = [[NSMutableString new] autorelease];
    }

}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if(self.parsedString){
        [self.itemDictionary setObject: self.parsedString forKey: elementName];
        
        [_parsedString release];
        _parsedString = nil;
        //self.parsedString = nil;
    }
    if([elementName isEqualToString:@"item"]){
        NewsItem *newsItem = [[NewsItem alloc]initWithDictionary: self.itemDictionary];
        [self.items addObject: newsItem];
        [newsItem release];
        
        [_itemDictionary release];
        _itemDictionary = nil;
        //self.itemDictionary = nil;
        //NSLog(@"parsedString DidElemenet is %lu", newsItem.retainCount);
    }
 }

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    [self.parsedString appendString: string];
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    
    if(self.completion){
        self.completion(self.items, nil);
    }
    [self reset];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"Error - %@",parseError.userInfo);
    if(parseError){
        self.completion(nil, parseError);
    }
    [self reset];
}

-(void)reset{
    _parsedString = nil;
    _items = nil;
    _itemDictionary = nil;
    _completion = nil;
}


-(void)dealloc{
    NSLog(@"RSSParser dealloc");
    [_parsedString release];
    _parsedString = nil;
    
    [_items release];
    _items = nil;
    
    [_itemDictionary release];
    _itemDictionary = nil;
    
    [_completion release];
    _completion = nil;
    
    [super dealloc];
}

@end
