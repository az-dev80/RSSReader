//
//  Router.m
//  RSS Reader
//
//  Created by Albert Zhloba on 26.02.22.
//

#import "Router.h"
#import "Bulder.h"

@implementation Router

-(instancetype)initWithNavController: (UINavigationController *)navController andBuilder: (Builder<BuilderProtocol> *) builder {
    self = [super init];
    if (self){
        [navController retain];
        [builder retain];
        _navController = navController;
        _builder = builder;
    }
    return self;
}

- (void)intnialVC {
    UIViewController *vc = [self.builder createFirstScene: self];
    self.navController.viewControllers = @[vc];
}

- (void)showWebviewVC {
    UIViewController *vc = [self.builder createFirstScene: self];
    self.navController.viewControllers = @[vc];
}

-(void)dealloc {
    NSLog(@"Router dealloc");
    [_navController release];
    [_builder release];
    
    [super dealloc];
}

@end
