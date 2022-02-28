//
//  Bulder.m
//  RSS Reader
//
//  Created by Albert Zhloba on 26.02.22.
//

#import "Bulder.h"
#import "ViewController.h"

@implementation Builder

- (UIViewController *)createFirstScene:(Router *)router {
    ViewController *view = [[ViewController alloc]init];
    FirstSceneModel *model = [FirstSceneModel new];
    FirstScenePresenter * presenter = [[FirstScenePresenter alloc]initWithView:view andModel:model andRouter:router];
    view.presenter = presenter;
    
    return view;
}

@end
