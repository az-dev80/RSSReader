//
//  DetailsVC.m
//  RSS Reader
//
//  Created by Albert Zhloba on 6.04.22.
//

#import "DetailsVC.h"

@interface DetailsVC ()

@end

@implementation DetailsVC

-(instancetype)initWithTitle:(NSString *)newsTitle andDescription:(NSString *)newsDescription andDate:(NSString *)newsDate {
    if (self = [super init]){
        _newsTitle = newsTitle;
        _newsDescription = newsDescription;
        _newsDate = newsDate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTitleLabel];
    [self createPubDateLabel];
    [self createDescription];
}

-(void)createTitleLabel{
    UIFont * customFont = [UIFont boldSystemFontOfSize:20];
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = self.newsTitle;
    titleLabel.font = customFont;
    titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    titleLabel.numberOfLines = 3;
    titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.minimumScaleFactor = 10.0f/12.0f;
    titleLabel.clipsToBounds = YES;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:titleLabel];
    
    [[titleLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:60] setActive:true];
    [[titleLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20] setActive:true];
    [[titleLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20] setActive:true];
    [[titleLabel.heightAnchor constraintEqualToConstant:60] setActive:true];
}

-(void)createPubDateLabel{
    NSLog(@"self.newsDate is %@",self.newsDate);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"E, d MMM yyyy HH:mm:ss Z"];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    NSDate *date  = [dateFormatter dateFromString:self.newsDate];
    NSLog(@"%@",date);
    // Convert to new Date Format
    [dateFormatter setDateFormat:@"d MMM yyyy"];
    NSString *newDate = [dateFormatter stringFromDate:date];
    
    UIFont * customFont = [UIFont italicSystemFontOfSize:18];
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = newDate;
    titleLabel.font = customFont;
    titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    titleLabel.numberOfLines = 1;
    titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.minimumScaleFactor = 10.0f/12.0f;
    titleLabel.clipsToBounds = YES;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:titleLabel];
    
    [[titleLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:130] setActive:true];
    [[titleLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20] setActive:true];
    [[titleLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20] setActive:true];
    [[titleLabel.heightAnchor constraintEqualToConstant:50] setActive:true];
}

-(void)createDescription{
    UIFont * customFont = [UIFont systemFontOfSize:18];
    UITextView *myTextView = [[UITextView alloc] init];
    myTextView.text = self.newsDescription;
    myTextView.font = customFont;
    myTextView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:myTextView];
    [myTextView sizeToFit];
    
    [[myTextView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:190] setActive:true];
    [[myTextView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20] setActive:true];
    [[myTextView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20] setActive:true];
    [[myTextView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-50] setActive:true];
}

-(void)dealloc{
    NSLog(@"Item dealloc");
    [_newsTitle release];
    [_newsDescription release];
    [_newsDate release];
    
    [super dealloc];
}

@end
