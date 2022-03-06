//
//  SceneDelegate.m
//  RSS Reader
//
//  Created by Albert Zhloba on 27.01.22.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "Router.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    UIViewController * vc = [[ViewController alloc]init];
    Builder *builder = [[Builder alloc]init];
    Router *router = [[Router alloc]initWithController:vc andBuilder:builder];
    vc = [router intnialVC];
    NSLog(@"builder is %lu", builder.retainCount);
    NSLog(@"router is %lu", router.retainCount);
    NSLog(@"vc is %lu", vc.retainCount);
    [builder release];
    [router release];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    //NSLog(@"builder is %lu", builder.retainCount);
    //NSLog(@"router is %lu", router.retainCount);
    NSLog(@"vc is %lu", vc.retainCount);
//    mainVC = router.intnialVC() as! ViewController

}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.

    // Save changes in the application's managed object context when the application transitions to the background.
    [(AppDelegate *)UIApplication.sharedApplication.delegate saveContext];
}

- (void)dealloc{
    NSLog(@"Scene dealloc");
    [_window release];
    [super dealloc];
}

@end
