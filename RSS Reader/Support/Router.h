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

-(UIViewController *)intnialVC;
@end

@interface Router: NSObject<RouterProtocol>
-(instancetype)initWithController: (UIViewController *)viewController andBuilder: (Builder<BuilderProtocol> *) builder;
@property(nonatomic, retain) UIViewController *viewController;
@property(nonatomic, retain) Builder<BuilderProtocol> *builder;

@end
