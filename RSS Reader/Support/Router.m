//
//  Router.m
//  RSS Reader
//
//  Created by Albert Zhloba on 26.02.22.
//

#import "Router.h"
#import "Bulder.h"

@implementation Router

-(instancetype)initWithController: (UIViewController *)viewController andBuilder: (Builder<BuilderProtocol> *) builder {
    self = [super init];
    if (self){
        [viewController retain];
        [builder retain];
        _viewController = viewController;
        _builder = builder;
    }
    return self;
}

- (UIViewController *)intnialVC {
    self.viewController = [self.builder createFirstScene: self];
    return [self.viewController autorelease];
}

-(void)dealloc {
    NSLog(@"Router dealloc");
    [_viewController release];
    [_builder release];
    
    [super dealloc];
}

@end
