//
//  ViewController.h
//  RSS Reader
//
//  Created by Albert Zhloba on 27.01.22.
//

#import <UIKit/UIKit.h>
#import "FirstScenePresenter.h"

@interface ViewController : UIViewController <FirstSceneViewProtocol>

@property(nonatomic, retain)id<FirstSceneViewPresenterProtocol> presenter;

@end

