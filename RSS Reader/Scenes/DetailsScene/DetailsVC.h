//
//  DetailsVC.h
//  RSS Reader
//
//  Created by Albert Zhloba on 6.04.22.
//

#import <UIKit/UIKit.h>

@interface DetailsVC : UIViewController

@property(nonatomic, copy) NSString *newsTitle;
@property(nonatomic, copy) NSString *newsDescription;
@property(nonatomic, copy) NSString *newsDate;

-(instancetype)initWithTitle:(NSString *)newsTitle andDescription:(NSString *)newsDescription andDate:(NSString *)newsDate;

@end

