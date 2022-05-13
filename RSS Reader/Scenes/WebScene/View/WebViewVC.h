//
//  WebViewVC.h
//  RSS Reader
//
//  Created by Albert Zhloba on 1.02.22.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "WebViewPresenter.h"

@interface WebViewVC : UIViewController <WebViewProtocol>

@property (copy, nonatomic) NSURL *url;
@property (retain, nonatomic) WKWebView *webView;
@property(nonatomic, retain)id<WebViewPresenterProtocol>presenterWeb;
//-(instancetype)initWithUrl:(NSString *)string;

@end
