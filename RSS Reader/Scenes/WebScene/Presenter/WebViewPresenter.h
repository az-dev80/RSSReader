//
//  WebViewPresenter.h
//  RSS Reader
//
//  Created by Albert Zhloba on 8.05.22.
//

#import <Foundation/Foundation.h>
#import "DataManager.h"
@protocol DataManagerProtocol;

@protocol WebViewProtocol <NSObject>
-(void)setupWebViewWithURL:(NSURL *)url;
@end

@protocol WebViewPresenterProtocol <NSObject>
@property(nonatomic, retain) NSIndexPath *indexPath;
@property(nonatomic, retain) id<DataManagerProtocol>dataManager;
@property(nonatomic, weak) id<WebViewProtocol> webView;
-(instancetype)initWithView: (id<WebViewProtocol>)view indexPath:(NSIndexPath *)indexPath;
-(void)sendLinkToView;
@end

@interface WebViewPresenter : NSObject <WebViewPresenterProtocol>
@property(nonatomic, retain) NSIndexPath *indexPath;
@property(nonatomic, retain) id<DataManagerProtocol>dataManager;
@property(nonatomic, weak) id<WebViewProtocol> webView;
@end

