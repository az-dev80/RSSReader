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
}

@property (retain, nonatomic) UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    
    feed = [[NSMutableArray alloc]init];
    NSURL *url = [NSURL URLWithString:@"https://www.jpl.nasa.gov/feeds/news"];
    parser = [[NSXMLParser alloc]initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
    //[self.myTableView autorelease];
    [parser release];
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
    [self.myTableView reloadData];
}

-(void)dealloc{
    [_myTableView release];
    [super dealloc];
}

@end
