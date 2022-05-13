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

@property(nonatomic, retain) UINavigationController *navController;
@property(nonatomic, retain) Builder<BuilderProtocol> *builder;
-(instancetype)initWithNavController: (UINavigationController *)navController andBuilder: (Builder<BuilderProtocol>*)builder;
-(void)intnialVC;
-(void)showWebView:(NSIndexPath *)indexPath;
-(void)showDetailsVC:(NSIndexPath *)indexPath;

@end

@interface Router: NSObject<RouterProtocol>

@property(nonatomic, retain) UINavigationController *navController;
@property(nonatomic, retain) Builder<BuilderProtocol> *builder;

@end
