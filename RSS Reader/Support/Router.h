//
//  Router.h
//  RSS Reader
//
//  Created by Albert Zhloba on 26.02.22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Bulder.h"

@protocol RouterProtocol <NSObject>

-(void)intnialVC;
-(void)showWebviewVC;

@end

@interface Router: NSObject<RouterProtocol>
-(instancetype)initWithNavController: (UINavigationController *)navController andBuilder: (Builder<BuilderProtocol> *) builder;
@property(nonatomic, retain) UINavigationController *navController;
@property(nonatomic, retain) Builder<BuilderProtocol> *builder;

@end
