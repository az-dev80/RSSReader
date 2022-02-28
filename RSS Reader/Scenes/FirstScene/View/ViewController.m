//
//  ViewController.m
//  RSS Reader
//
//  Created by Albert Zhloba on 27.01.22.
//

#import "ViewController.h"
#import "WebViewVC.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSXMLParser *parser;
    NSMutableArray *feed;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;
    UIActivityIndicatorView *indi;
}

@property (retain, nonatomic) UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    indi = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 1, 1)];
    indi.activityIndicatorViewStyle = UIActivityIndicatorViewStyleLarge;
    indi.color = [UIColor blackColor];
    //indi.translatesAutoresizingMaskIntoConstraints = false;
    indi.center = self.view.center;
    [self.view addSubview:indi];
    [self.view bringSubviewToFront:indi];
    indi.hidden = false;
    [indi startAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIActivityIndicatorView *indi1 = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(80, 80, 40, 40)];
//    //indi.activityIndicatorViewStyle = UIActivityIndicatorViewStyleLarge;
//    indi1.color = [UIColor blackColor];
//    //indi.translatesAutoresizingMaskIntoConstraints = false;
//    //indi.center = self.view.center;
//    [self.view addSubview:indi1];
//    [self.view bringSubviewToFront:indi1];
//    indi1.hidden = false;
//    [indi1 startAnimating];
//    NSLog(@"%@", indi1);
    //[[indi.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] isActive];
    //[[indi.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] isActive];
    //[indi startAnimating];
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    
    feed = [[NSMutableArray alloc]init];
    
    NSThread *thread = [[NSThread alloc]initWithBlock:^{
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [indi startAnimating];
//        });
        NSURL *url = [NSURL URLWithString:@"https://www.jpl.nasa.gov/feeds/news"];
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:url
                                             options:NSDataReadingUncached
                                               error:&error];
        
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error){
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Data has not been obtained" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:action];
                [weakSelf presentViewController:alert animated:false completion:nil];
                NSLog(@"%@", [error localizedDescription]);
            } else {
                NSLog(@"Data has been loaded successfully. Data -> %@", data);
            }
        });
        
        parser = [[NSXMLParser alloc]initWithData:data];
        [parser setDelegate:self];
        [parser setShouldResolveExternalEntities:NO];
        if (![parser parse]) {
            NSError *error = [parser parserError];
            NSLog (@"Error parsing '%@'\n%@", url, error) ; // Error is null
        }
        [parser parse];
        
        //[self.myTableView autorelease];
        [parser release];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [indi stopAnimating];
//        });
    }];
    [thread start];
    
    //[feed release];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
    }
    cell.textLabel.text = [[feed objectAtIndex:indexPath.row]objectForKey:@"title"];
    return  cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return feed.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *string = [feed [indexPath.row]objectForKey:@"link"];
    NSURL *urlFromLink = [NSURL URLWithString:string];
    [[UIApplication sharedApplication] openURL:urlFromLink options:nil completionHandler:nil];
    //WebViewVC *vc = [[WebViewVC alloc]initWithUrl:string];
    //[self presentViewController:[vc autorelease] animated:YES completion:nil];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    element = elementName;
    if([element isEqualToString:@"item"]){
        item = [[NSMutableDictionary alloc]init];
        title = [[NSMutableString alloc]init];
        link = [[NSMutableString alloc]init];
        
        [item autorelease];
//        [title autorelease];
//        [link autorelease];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if([elementName isEqualToString:@"item"]){
        [item retain];
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        [feed addObject:[item copy]];
        
        [item release];
        //[item release];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if([element isEqualToString:@"title"]){
        [title appendString:string];
    }
    else if ([element isEqualToString:@"link"]){
        [link appendString:string];
    }
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    dispatch_async(dispatch_get_main_queue(), ^{
        [indi stopAnimating];
        [self.myTableView reloadData];
    });
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"Error - %@",parseError.userInfo);
}

-(void)dealloc{
    [_myTableView release];
    [super dealloc];
}

@end
