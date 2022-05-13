//
//  DetailsPresenter.h
//  RSS Reader
//
//  Created by Albert Zhloba on 19.04.22.
//

#import <Foundation/Foundation.h>
#import "Router.h"
#import "DataManager.h"
@protocol DataManagerProtocol;
@protocol RouterProtocol;

@protocol DetailsViewProtocol <NSObject>
-(instancetype)initWithIndexPath:(NSIndexPath *)indexPath;
-(void)setDataToLabelsTitle: (NSString *)newsTitle andDescription:(NSString *)newsDescription andDate:(NSString *)newsDate;
@end

@protocol DetailsViewPresenterProtocol <NSObject>
@property(nonatomic, retain) id<DataManagerProtocol>dataManager;
@property(nonatomic, retain) id<RouterProtocol>router;
@property(nonatomic, weak) id<DetailsViewProtocol> detailsView;
-(instancetype)initWithView: (id<DetailsViewProtocol>)view router:(id<RouterProtocol>)router;
-(void)setDataToView:(NSIndexPath *)indexPath;
@end

@interface DetailsPresenter : NSObject <DetailsViewPresenterProtocol>
@property(nonatomic, retain) id<DataManagerProtocol>dataManager;
@property(nonatomic, weak) id<DetailsViewProtocol> detailsView;
@property(nonatomic, retain) id<RouterProtocol>router;
@end


