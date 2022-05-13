//
//  DataManager.h
//  RSS Reader
//
//  Created by Albert Zhloba on 4.05.22.
//

#import <Foundation/Foundation.h>
#import "RSSParser.h"
#import "Loader.h"
#import "FirstScenePresenter.h"
#import "Model.h"
#import "DetailsPresenter.h"
#import "WebViewPresenter.h"
@protocol FirstSceneViewPresenterProtocol;
@protocol DetailsViewPresenterProtocol;
@protocol WebViewPresenterProtocol;

@protocol DataManagerProtocol <NSObject>

@property(nonatomic, weak)id<FirstSceneViewPresenterProtocol>presenter;
@property(nonatomic, weak)id<DetailsViewPresenterProtocol>presenterDetails;
@property(nonatomic, weak)id<WebViewPresenterProtocol>presenterWeb;
@property(nonatomic, retain)id<ModelProtocol>model;
@property (nonatomic, retain)id<RSSParserProtocol>parser;
@property (nonatomic, retain)id<LoaderProtocol>loader;

-(instancetype)initWithParser: (id<RSSParserProtocol>)parser loader:(id<LoaderProtocol>)loader model:(id<ModelProtocol>)model;
-(void)prepareData;
-(NSArray<NewsItem *> *)returnModel;

@end

@interface DataManager : NSObject <DataManagerProtocol>

@property(nonatomic, weak)id<FirstSceneViewPresenterProtocol>presenter;
@property(nonatomic, weak)id<DetailsViewPresenterProtocol>presenterDetails;
@property(nonatomic, weak)id<WebViewPresenterProtocol>presenterWeb;
@property(nonatomic, retain)id<ModelProtocol>model;
@property (nonatomic, retain)id<RSSParserProtocol>parser;
@property (nonatomic, retain)id<LoaderProtocol>loader;

@end

