//
//  NewsItem.m
//  RSS Reader
//
//  Created by Albert Zhloba on 4.03.22.
//

#import "NewsItem.h"

@implementation NewsItem

-(instancetype)initWithDictionary: (NSDictionary *) dictionary {
    self = [super init];
    if (self){
        //[dictionary retain];
        _newsTitle = [dictionary[@"title"] copy];
        _newsDescription = [dictionary[@"description"] copy];
        _newsLink = [dictionary[@"link"] copy];
    }
    return self;
}

-(void)dealloc{
    NSLog(@"Item dealloc");
    [_newsTitle release];
    [_newsDescription release];
    [_newsLink release];
    
    [super dealloc];
}
@end
