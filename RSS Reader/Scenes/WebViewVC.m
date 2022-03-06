//
//  WebViewVC.m
//  RSS Reader
//
//  Created by Albert Zhloba on 1.02.22.
//

#import "WebViewVC.h"

@interface WebViewVC ()

@end

@implementation WebViewVC

-(instancetype)initWithUrl:(NSString *)string{
    self = [super init];
    if (self){
        self.url = string;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSURL *urlFromLink = [NSURL URLWithString:self.url];
    //WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    //self.webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:theConfiguration];
    //webView.navigationDelegate = self;
    //NSURL *nsurl=[NSURL URLWithString:urlFromLink];
    //NSURLRequest *nsrequest=[NSURLRequest requestWithURL: urlFromLink];
    //[self.webView loadRequest:nsrequest];
    //[self.view addSubview:self.webView];
    //[theConfiguration release];
}

- (void)dealloc{
    [_url release];
    [_webView release];
    [super dealloc];
}

@end
