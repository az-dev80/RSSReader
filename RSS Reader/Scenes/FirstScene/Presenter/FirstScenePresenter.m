//
//  FirstScenePresenter.m
//  RSS Reader
//
//  Created by Albert Zhloba on 27.02.22.
//

#import "FirstScenePresenter.h"

@implementation FirstScenePresenter

-(instancetype)initWithView: (id<FirstSceneViewProtocol>)view andModel:(id<FirstSceneModelProtocol>)model andRouter:(id<RouterProtocol>)router {
    self = [super init];
    if (self){
        _view = view;
        _model = model;
        _router = router;
    }
    return  self;
}

//required init(view: WalletsViewProtocol, storageService: WalletsModelInput, router: RouterProtocol) {
//    self.view = view
//    self.storageService = storageService
//    self.router = router
//    getWallets()
//}
//
//func getWallets() {
//    storageService.getWallets { [weak self] result in
//        guard let self = self else {return}
//        DispatchQueue.main.async {
//            switch result {
//            case .success(let wallets):
//                self.wallets = wallets
//                self.view?.success()
//            case .failure(let error):
//                self.view?.failure(error:error)
//            }
//        }
//    }
//}
@end
