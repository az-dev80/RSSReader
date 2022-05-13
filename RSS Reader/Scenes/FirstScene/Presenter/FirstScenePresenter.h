//
//  FirstScenePresenter.h
//  RSS Reader
//
//  Created by Albert Zhloba on 27.02.22.
//

#import <Foundation/Foundation.h>
#import "Alert.h"
@protocol DataManagerProtocol;
@protocol RouterProtocol;

#pragma mark --- View Protocol
@protocol FirstSceneViewProtocol <NSObject>
-(void)showAlert:(UIAlertController *)alert;
-(void)setupData:(NSArray *)model;
@end

#pragma mark --- Presenter Protocol
@protocol FirstSceneViewPresenterProtocol <NSObject>

@property(nonatomic, weak) id<FirstSceneViewProtocol> view;
@property(nonatomic, retain) id<RouterProtocol>router;
@property(nonatomic, retain) id<DataManagerProtocol>dataManager;

-(instancetype)initWithView: (id<FirstSceneViewProtocol>)view router:(id<RouterProtocol>)router;
-(void)showAlertInView:(UIAlertController *)alert;
-(void)provideData;
-(void)obtainFeeds:(NSArray *)feeds;
-(void)showDetailsVC:(NSIndexPath *)indexPath;
-(void)showWebView:(NSIndexPath *)indexPath;

@end

#pragma mark --- Presenter Class
@interface FirstScenePresenter : NSObject<FirstSceneViewPresenterProtocol>

@property(nonatomic, weak) id<FirstSceneViewProtocol>view;
@property(nonatomic, retain) id<RouterProtocol>router;
@property(nonatomic, retain)id<DataManagerProtocol>dataManager;

@end

