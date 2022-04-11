//
//  WebViewVC.m
//  RSS Reader
//
//  Created by Albert Zhloba on 1.02.22.
//
#import <UIKit/UIKit.h>
#import "WebViewVC.h"

@interface WebViewVC () <WKNavigationDelegate>

@end

@implementation WebViewVC

-(instancetype)initWithUrl:(NSString *)string{
    self = [super init];
    if (self){
        self.url = string;
    }
    return self;
}
//- (void)loadView{
//    self.webView = [WKWebView new];
//    self.webView.navigationDelegate = self;
//    self.view = self.webView;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray <UIBarButtonItem *> *items = [NSMutableArray new];
    [items addObject: [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"button-back"] style:UIBarButtonItemStylePlain target:self action:@selector(backWebviewAction)]];
    [items addObject: [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
    [items addObject: [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"button-forward"] style:UIBarButtonItemStylePlain target:self action:@selector(forwardWebviewAction)]];
    [items addObject: [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
    [items addObject: [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action: @selector(refreshWebviewAction)]];
    [items addObject: [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
    [items addObject: [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action: @selector(stopWebviewAction)]];
    [items addObject: [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
    [items addObject: [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"button-safari"] style:UIBarButtonItemStylePlain target:self action:@selector(safariAction)]];
    UIToolbar *toolbar = [[UIToolbar alloc]init];
    [toolbar setTranslucent:false];
    toolbar.translatesAutoresizingMaskIntoConstraints = false;
    //self.toolbarItems = items;
    toolbar.items = items;
    [toolbar setBarTintColor:[UIColor blueColor]];
    [toolbar setTintColor:[UIColor orangeColor]];
    
    //CGRect mainScreenFrame = [[UIScreen mainScreen] bounds];
    //toolbar.frame = CGRectMake(0,mainScreenFrame.size.height-75, self.view.bounds.size.width, 75);
    
    NSURL *urlFromLink = [NSURL URLWithString:self.url];
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:theConfiguration];
    self.webView.navigationDelegate = self;
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL: urlFromLink];
    [self.webView loadRequest:nsrequest];
    [self.view addSubview:self.webView];
    [self.view addSubview:toolbar];
    [[toolbar.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor] setActive:true];
    [[toolbar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor] setActive:true];
    [[toolbar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor] setActive:true];
    [[toolbar.heightAnchor constraintEqualToConstant:55] setActive:true];
    //[self.view insertSubview:self.webView belowSubview:self.navigationController.toolbar];
    [theConfiguration release];
}

- (BOOL)prefersStatusBarHidden{
    return true;
}

-(void)backWebviewAction {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
}

-(void)forwardWebviewAction {
    if ([self.webView canGoForward]) {
        [self.webView goForward];
    }
}

-(void)refreshWebviewAction {
    [self.webView reload];
}

-(void)stopWebviewAction {
    [self.webView stopLoading];
}

-(void)safariAction {
    NSURL *urlFromLink = [NSURL URLWithString:self.url];
    [[UIApplication sharedApplication] openURL:urlFromLink options:@{}  completionHandler:nil];
}

//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
//    if (navigationAction.navigationType == WKNavigationTypeLinkActivated) {
//            if (navigationAction.request.URL) {
//                NSLog(@"%@", navigationAction.request.URL.host);
//                if (![navigationAction.request.URL.resourceSpecifier containsString:@"ex path"]) {
//                    if ([[UIApplication sharedApplication] canOpenURL:navigationAction.request.URL]) {
//                        [[UIApplication sharedApplication] openURL:navigationAction.request.URL options:@{}  completionHandler:nil];
//                        decisionHandler(WKNavigationActionPolicyCancel);
//                    }
//                } else {
//                    decisionHandler(WKNavigationActionPolicyAllow);
//                }
//            }
//        } else {
//            decisionHandler(WKNavigationActionPolicyAllow);
//        }
//}

- (void)dealloc{
    [_url release];
    [_webView release];
    [super dealloc];
}

@end
