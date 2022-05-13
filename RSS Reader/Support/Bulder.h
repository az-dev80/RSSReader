//
//  Bulder.h
//  RSS Reader
//
//  Created by Albert Zhloba on 26.02.22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol RouterProtocol;

@protocol BuilderProtocol

-(UIViewController *)createFirstScene:(id<RouterProtocol>)router;
-(UIViewController *)createDetailsScene:(id<RouterProtocol>)router withIndexPath:(NSIndexPath *)indexPath;
-(UIViewController *)createWebViewScene:(id<RouterProtocol>)router withIndexPath:(NSIndexPath *)indexPath;

@end

@interface Builder : NSObject<BuilderProtocol>

@end

