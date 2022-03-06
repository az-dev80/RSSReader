//
//  FirstScenePresenter.h
//  RSS Reader
//
//  Created by Albert Zhloba on 27.02.22.
//

#import <Foundation/Foundation.h>
#import "Router.h"
#import "FirstSceneModel.h"

@protocol FirstSceneViewProtocol <NSObject>
    //func success()
    //func failure(error:Error)

@end

@protocol FirstSceneViewPresenterProtocol <NSObject>
-(instancetype)initWithView: (id<FirstSceneViewProtocol>)view andModel:(id<FirstSceneModelProtocol>)model andRouter:(id<RouterProtocol>)router;
   // func    getWallets()
   // var     wallets:[NSManagedObject]? { get set }
   // func    tapPlusButton()
   // func    openWalletDetailsVC(wallet: NSManagedObject, walletIndex: IndexPath)
   // func    deleteAllWallets()
@end

@interface FirstScenePresenter : NSObject<FirstSceneViewPresenterProtocol>

@property(nonatomic, retain) id<FirstSceneViewProtocol> view;
@property(nonatomic, retain) id<RouterProtocol>router;
@property(nonatomic, retain) id<FirstSceneModelProtocol>model;

@end

