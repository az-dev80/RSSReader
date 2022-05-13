//
//  Model.m
//  RSS Reader
//
//  Created by Albert Zhloba on 6.05.22.
//

#import "Model.h"

@implementation Model

-(void)dealloc{
    [_feeds release];
    
    [super dealloc];
}

//- (void)saveFeeds:(NSArray *)feeds {
//    self.feeds = feeds;
//}

@end
