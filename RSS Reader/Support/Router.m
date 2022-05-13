//
//  Router.m
//  RSS Reader
//
//  Created by Albert Zhloba on 26.02.22.
//

#import "Router.h"

@implementation Router

-(instancetype)initWithNavController: (UINavigationController *)navController andBuilder: (Builder<BuilderProtocol>*)builder {
    self = [super init];
    if (self){
        _navController = [navController retain];
        _builder = [builder retain];
    }
    return self;
}

- (void)intnialVC {
    UIViewController *vc = [self.builder createFirstScene: self];
    self.navController.viewControllers = @[vc];
    //[vc release];
}

-(void)showWebView:(NSIndexPath *)indexPath {
    UIViewController *vc = [self.builder createWebViewScene: self withIndexPath:indexPath];
    [self.navController pushViewController:vc animated:true];
}

- (void)showDetailsVC:(NSIndexPath *)indexPath {
    UIViewController *vc = [self.builder createDetailsScene: self withIndexPath:indexPath];
    [self.navController pushViewController:vc animated:true];
}


-(void)dealloc {
    NSLog(@"Router dealloc %@", self);
    [_navController release];
    [_builder release];
    
    [super dealloc];
}

@end
