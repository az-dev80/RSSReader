//
//  DetailsVC.m
//  RSS Reader
//
//  Created by Albert Zhloba on 6.04.22.
//

#import "DetailsVC.h"
#import "DateFormatterStringToString.h"

@implementation DetailsVC

//-(instancetype)initWithTitle:(NSString *)newsTitle andDescription:(NSString *)newsDescription andDate:(NSString *)newsDate {
//    if (self = [super init]){
//        _newsTitle = [newsTitle copy];
//        _newsDescription = [newsDescription copy];
//        _newsDate = [newsDate copy];
//    }
//    return self;
//}

-(instancetype)initWithIndexPath:(NSIndexPath *)indexPath{
    if (self = [super init]){
        _indexPath = [indexPath retain];
    }
    return self;
}

- (void)setDataToLabelsTitle:(NSString *)newsTitle andDescription:(NSString *)newsDescription andDate:(NSString *)newsDate {
    self.titleLabel.text = newsTitle;
    self.pubDateLabel.text = [DateFormatterStringToString formattedDate:newsDate];
    self.descriptionTF.text = newsDescription;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTitleLabel];
    [self createPubDateLabel];
    [self createDescription];
    [self setupConstraints];
    [self.presenterDetails setDataToView:self.indexPath];
}

-(void)createTitleLabel{
    //NSLog(@"string is %@", self.newsTitle);
    UIFont * customFont = [UIFont boldSystemFontOfSize:20];
    UILabel *titleLabel = [[UILabel alloc]init];
    //titleLabel.text = self.newsTitle;
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
    self.titleLabel = titleLabel;
    [self.view addSubview:self.titleLabel];
    
    
}

-(void)createPubDateLabel{
    UIFont * customFont = [UIFont italicSystemFontOfSize:18];
    UILabel *titleLabel = [[UILabel alloc]init];
    //titleLabel.text = [DateFormatterStringToString formattedDate:self.newsDate];
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
    self.pubDateLabel = titleLabel;
    [self.view addSubview:self.pubDateLabel];
}

-(void)createDescription{
    UIFont * customFont = [UIFont systemFontOfSize:18];
    UITextView *myTextView = [[UITextView alloc] init];
    //myTextView.text = self.newsDescription;
    myTextView.font = customFont;
    myTextView.translatesAutoresizingMaskIntoConstraints = false;
    self.descriptionTF = myTextView;
    [self.view addSubview:self.descriptionTF];
    [self.descriptionTF sizeToFit];
}

//- (void)viewWillLayoutSubviews{
//    [super viewWillLayoutSubviews];
//    [self setupConstraints];
//}

-(void)setupConstraints{
    [[self.titleLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:10] setActive:true];
    [[self.titleLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20] setActive:true];
    [[self.titleLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20] setActive:true];
    [[self.titleLabel.heightAnchor constraintEqualToConstant:60] setActive:true];
    
    [[self.pubDateLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:30] setActive:true];
    [[self.pubDateLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20] setActive:true];
    [[self.pubDateLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20] setActive:true];
    [[self.pubDateLabel.heightAnchor constraintEqualToConstant:50] setActive:true];
    
    [[self.descriptionTF.topAnchor constraintEqualToAnchor:self.pubDateLabel.bottomAnchor constant:30] setActive:true];
    [[self.descriptionTF.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20] setActive:true];
    [[self.descriptionTF.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20] setActive:true];
    [[self.descriptionTF.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-50] setActive:true];
}

-(void)dealloc{
    NSLog(@"DetailsVC dealloc");
    //[_newsTitle release];
    //[_newsDescription release];
    //[_newsDate release];
    [_titleLabel release];
    [_pubDateLabel release];
    [_descriptionTF release];
    [_indexPath release];
    [_presenterDetails release];
    
    [super dealloc];
}

@end
