//
//  Bulder.h
//  RSS Reader
//
//  Created by Albert Zhloba on 26.02.22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Router;

@protocol BuilderProtocol

-(UIViewController *)createFirstScene:(Router *) router;

@end

@interface Builder : NSObject<BuilderProtocol>

@end

