//
//  ViewController.m
//  RSS Reader
//
//  Created by Albert Zhloba on 27.01.22.
//

#import "ViewController.h"
#import "WebViewVC.h"
#import "RSSParser.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) UITableView *myTableView;
@property (retain, nonatomic) NSArray *feeds;
@property (retain, nonatomic) UIActivityIndicatorView *indi;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.indi = [[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge] autorelease];
    //indi.translatesAutoresizingMaskIntoConstraints = false;
    self.indi.center = self.view.center;
    [self.view addSubview:self.indi];
    //[[indi.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] isActive];
    //[[indi.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] isActive];
    //[[indi.widthAnchor constraintEqualToConstant:40.0] isActive];
    //[[indi.heightAnchor constraintEqualToConstant:40.0] isActive];
    
    //[indi startAnimating];
    __weak typeof(self) weakSelf = self;
    self.myTableView = [[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain] autorelease];
    self.myTableView.delegate = weakSelf;
    self.myTableView.dataSource = weakSelf;
    [self.view addSubview:self.myTableView];
    
    [self.view bringSubviewToFront:self.indi];
    
    //__weak typeof(self) weakSelf = self;
    
    NSThread *thread = [[[NSThread alloc]initWithBlock:^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.indi startAnimating];
        });
        
        NSURL *url = [NSURL URLWithString:@"https://www.jpl.nasa.gov/feeds/news"];
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:url
                                             options:NSDataReadingUncached
                                               error:&error];
        
        if (error){
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Data has not been obtained" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:action];
                [weakSelf presentViewController:alert animated:false completion:nil];
                NSLog(@"%@", [error localizedDescription]);
            });
            return;
        } else {
            NSLog(@"Data has been loaded successfully. Data -> %@", data);
        }
        
        [weakSelf parserWork:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.indi stopAnimating];
            [self.myTableView reloadData];
        });
        
    }] autorelease];
    
    [thread start];
}

-(void)parserWork: (NSData *) data {
    
    RSSParser *parser = [[RSSParser alloc]init];
    [parser parseDataWithCompletion:data completionHandler:^(NSArray<NewsItem *> *newsItems, NSError *error) {
        
        if (error) {
            __weak typeof(self) weakSelf = self;
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Data is corrupted" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:action];
                [weakSelf presentViewController:alert animated:false completion:nil];
                NSLog(@"%@", [error localizedDescription]);
            });
            return;
        }
        __weak typeof(self) weakSelf = self;
        weakSelf.feeds = newsItems;
        [newsItems release];
        
    }];
    [parser release];
    NSLog(@"parsedString data is %lu", data.retainCount);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.indi startAnimating];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
    }
    ;
    cell.textLabel.text = [self.feeds[indexPath.row] newsTitle];
    return  cell ;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feeds.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *string = [self.feeds[indexPath.row] newsLink];
    NSURL *urlFromLink = [NSURL URLWithString:string];
    [[UIApplication sharedApplication] openURL:urlFromLink options:nil completionHandler:nil];
    
    //WebViewVC *vc = [[WebViewVC alloc]initWithUrl:string];
    //[self presentViewController:[vc autorelease] animated:YES completion:nil];
}

-(void)dealloc{
    NSLog(@"VIewC dealloc");
    [_myTableView release];
    _myTableView = nil;
    [_feeds release];
    _feeds = nil;
    [_presenter release];
    _presenter = nil;
   [_indi release];
    _indi = nil;
    [super dealloc];
}

@end
