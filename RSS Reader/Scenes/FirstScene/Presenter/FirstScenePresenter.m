//
//  FirstScenePresenter.m
//  RSS Reader
//
//  Created by Albert Zhloba on 27.02.22.
//

#import "FirstScenePresenter.h"
#import "Router.h"
#import "DataManager.h"

@implementation FirstScenePresenter

-(instancetype)initWithView: (id<FirstSceneViewProtocol>)view router:(id<RouterProtocol>)router {
    self = [super init];
    if (self){
        _view = view;
        _router = [router retain];
    }
    return  self;
}

-(void)showAlertInView:(UIAlertController *)alert {
    [self.view showAlert: alert];
}

- (void)provideData {
    [self.dataManager prepareData];
}

-(void)obtainFeeds:(NSArray *)feeds{
    [self.view setupData:feeds];
}

- (void)showDetailsVC:(NSIndexPath *)indexPath {
    [self.router showDetailsVC: indexPath];
}

-(void)showWebView:(NSIndexPath *)indexPath{
    [self.router showWebView: indexPath];
}

-(void)dealloc{
    NSLog(@"FirstScene presenter dealloc");
    _view = nil;;
    [_router release];
    //[_dataManager release];
    
    [super dealloc];
}
@end
