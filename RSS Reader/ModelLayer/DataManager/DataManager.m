//
//  DataManager.m
//  RSS Reader
//
//  Created by Albert Zhloba on 4.05.22.
//

#import "DataManager.h"
#import "Constants.h"
#import "Alert.h"
#import "Loader.h"
#import "RSSParser.h"


@interface DataManager()
@property (retain, nonatomic) NSData *data;
@end

@implementation DataManager

-(instancetype)initWithParser: (id<RSSParserProtocol>)parser loader:(id<LoaderProtocol>)loader model:(id<ModelProtocol>)model {
    if(self = [super init]){
        _loader = [loader retain];
        _parser = [parser retain];
        _model = [model retain];
    }
    return self;
}

- (void)prepareData {
    NSThread *thread = [[[NSThread alloc]initWithBlock:^{
        NSURL *url = [NSURL URLWithString: STRING_URL];
        NSError *error = nil;
        NSData *data = [self.loader loadDataWithURL:url andError:&error];
        if (error){
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertController *alert = [Alert alertWithMessage:ERROR_NO_DATA];
                [self.presenter showAlertInView: alert];
            });
            return;
        } else {
            NSLog(@"Data has been loaded successfully. Data -> %@", data);
        }
        
        [self parseData:data];
    }] autorelease];
    
    [thread start];
}

- (void)parseData:(NSData *)data {
    //__weak typeof(self) weakSelf = self;
    //RSSParser *parser = [[RSSParser alloc]init];
    [self.parser parseDataWithCompletion:data completionHandler:^(NSArray<NewsItem *> *newsItems, NSError *error) {
        
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertController *alert = [Alert alertWithMessage:ERROR_CORRUPTED_DATA];
                [self.presenter showAlertInView: alert];
            });
            return;
        }
        
        
        [self.model setFeeds: newsItems];
       
        dispatch_async(dispatch_get_main_queue(), ^{
            //[self.model saveFeeds:newsItems];
            [self.presenter obtainFeeds: self.model.feeds];
            //[newsItems autorelease]; // вызывало креш -
        });
    }];
    [self.parser release];
}

-(NSArray<NewsItem *> *)returnModel{
    return self.model.feeds;
}

- (void)dealloc{
    NSLog(@"DataManager dealloc");
    [_loader release];
    [_parser release];
    _presenter = nil;
    [_data release];
    [_model release];
    _presenterDetails = nil;
    
    [super dealloc];
}

@end
