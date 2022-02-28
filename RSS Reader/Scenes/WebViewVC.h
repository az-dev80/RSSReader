//
//  WebViewVC.h
//  RSS Reader
//
//  Created by Albert Zhloba on 1.02.22.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebViewVC : UIViewController

@property (copy, nonatomic) NSString *url;
@property (retain, nonatomic) WKWebView *webView;
-(instancetype)initWithUrl:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
