//
//  WebViewPresenter.m
//  RSS Reader
//
//  Created by Albert Zhloba on 8.05.22.
//

#import "WebViewPresenter.h"

@implementation WebViewPresenter

- (instancetype)initWithView:(id<WebViewProtocol>)view indexPath:(NSIndexPath *)indexPath {
    self = [super init];
    if (self){
        _webView = view;
        _indexPath = [indexPath retain];
    }
    return  self;
}

- (void)sendLinkToView {
    NSArray<NewsItem *> *feeds = [self.dataManager returnModel];
    NSString *string = [feeds[self.indexPath.row] newsLink];
    NSURL *urlFromLink = [NSURL URLWithString:string];
    [self.webView setupWebViewWithURL:urlFromLink];
}

- (void)dealloc {
    NSLog(@"WebViewPresenter dealloc");
    _webView = nil;
    [_indexPath release];
    [_dataManager release];
    
    [super dealloc];
}

@end
