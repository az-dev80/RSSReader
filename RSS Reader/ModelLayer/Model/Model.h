//
//  Model.h
//  RSS Reader
//
//  Created by Albert Zhloba on 6.05.22.
//

#import <Foundation/Foundation.h>

@protocol ModelProtocol <NSObject>
@property (retain, nonatomic) NSArray *feeds;
//-(void)saveFeeds: (NSArray *)feeds;
@end

@interface Model : NSObject <ModelProtocol>

@property (retain, nonatomic) NSArray *feeds;

@end
