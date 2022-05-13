//
//  DetailsPresenter.m
//  RSS Reader
//
//  Created by Albert Zhloba on 19.04.22.
//

#import "DetailsPresenter.h"

@implementation DetailsPresenter

- (instancetype)initWithView:(id<DetailsViewProtocol>)view router:(id<RouterProtocol>)router {
    self = [super init];
    if (self){
        _detailsView = view;
        _router = [router retain];
    }
    return  self;
}

- (void)setDataToView:(NSIndexPath *)indexPath {
    NSArray<NewsItem *> *feeds = [self.dataManager returnModel];
    [self.detailsView setDataToLabelsTitle:[feeds[indexPath.row] newsTitle] andDescription:[feeds[indexPath.row] newsDescription] andDate:[feeds[indexPath.row] newsDate]];
}

-(void)dealloc{
    NSLog(@"Details Presenter dealloc");
    _detailsView = nil;
    [_router release];
    [_dataManager release];
    
    [super dealloc];
}

@end
