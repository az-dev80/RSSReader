//
//  Bulder.m
//  RSS Reader
//
//  Created by Albert Zhloba on 26.02.22.
//

#import "Bulder.h"
#import "ViewController.h"
#import "DataManager.h"
#import "DetailsVC.h"
#import "DetailsPresenter.h"
#import "Router.h"
#import "WebViewVC.h"
#import "WebViewPresenter.h"

@interface Builder(){
    DataManager *dataManager;
}

@property(nonatomic,retain)WebViewVC *viewWeb;
@end

@implementation Builder

- (UIViewController *)createFirstScene:(id<RouterProtocol>)router {
    //[router retain];
    ViewController *view = [[ViewController alloc]init];
    FirstScenePresenter * presenter = [[[FirstScenePresenter alloc]initWithView:view router:router] autorelease];
    
    RSSParser *parser = [[RSSParser alloc]init];
    Loader *loader = [[Loader alloc]init];
    Model *model = [[Model alloc]init];
    dataManager = [[[DataManager alloc]initWithParser:parser loader:loader model:model] autorelease];
    
    presenter.dataManager = dataManager;
    dataManager.presenter = presenter;
    view.presenter = presenter;
    
    [model release];
    //[presenter release]; //fail
    [parser release];
    [loader release];
    //[dataManager release]; //fail
    //NSLog(@"RT = %lu",(unsigned long)dataManager.retainCount);
    return [view autorelease];
}

- (UIViewController *)createDetailsScene:(id<RouterProtocol>)router withIndexPath:(NSIndexPath *)indexPath {
    DetailsVC *view = [[DetailsVC alloc]initWithIndexPath:indexPath];
    DetailsPresenter * presenter = [[DetailsPresenter alloc]initWithView:view router:router];
    
    dataManager.presenterDetails = presenter;
    presenter.dataManager = dataManager;
    view.presenterDetails = presenter;
    
    [presenter autorelease];
    //NSLog(@"RT = %lu",(unsigned long)dataManager.retainCount);
    return [view autorelease];
}

- (UIViewController *)createWebViewScene:(id<RouterProtocol>)router withIndexPath:(NSIndexPath *)indexPath {
    if (!self.viewWeb) {
        self.viewWeb = [[[WebViewVC alloc]init] autorelease];
    }
    WebViewPresenter *presenter = [[WebViewPresenter alloc]initWithView:self.viewWeb indexPath:indexPath];
    
    dataManager.presenterWeb = presenter;
    presenter.dataManager = dataManager;
    self.viewWeb.presenterWeb = presenter;
    
    [presenter autorelease];
    NSLog(@"RT = %lu",(unsigned long)self.viewWeb.retainCount);
    return self.viewWeb;
}



-(void)dealloc{
    NSLog(@"Builder dealloc");
    [dataManager release];
    [_viewWeb release];
    [super dealloc];
}
@end
