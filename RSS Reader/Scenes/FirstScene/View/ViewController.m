//
//  ViewController.m
//  RSS Reader
//
//  Created by Albert Zhloba on 27.01.22.
//

#import "ViewController.h"
#import "WebViewVC.h"
#import "RSSParser.h"
#import "DetailsVC.h"
#import "Constants.h"
#import "LoadingIndicator.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) UITableView *myTableView;
@property (retain, nonatomic) NSArray *feeds;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.presenter provideData];
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
    
    if (!self.feeds){
        [LoadingIndicator.shared show:self.view];
    }
}

-(void)setupTableView {
    self.myTableView = [[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain] autorelease];
    [self.view addSubview:self.myTableView];

    __weak typeof(self) weakSelf = self;
    self.myTableView.delegate = weakSelf;
    self.myTableView.dataSource = weakSelf;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
    }
    
    cell.textLabel.text = [self.feeds[indexPath.row] newsTitle];
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    return  cell ;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feeds.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.presenter showWebView: indexPath];
//    NSString *string = [self.feeds[indexPath.row] newsLink];
//    WebViewVC *vc = [[WebViewVC alloc]initWithUrl:string];
//    [self.navigationController pushViewController:[vc autorelease] animated:YES];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    [self.presenter showDetailsVC: indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        [LoadingIndicator.shared hide:self.view];;
    }
}

- (void)showAlert:(UIAlertController *)alert {
    [self presentViewController:alert animated:true completion:nil];
}

- (void)setupData:(NSArray *)model {
    self.feeds = model;
    [self.myTableView reloadData];
}

- (void)dealloc{
    NSLog(@"VIewC dealloc");
    [_myTableView release];
    [_feeds release];
    [_presenter release];
    
    [super dealloc];
}

@end
