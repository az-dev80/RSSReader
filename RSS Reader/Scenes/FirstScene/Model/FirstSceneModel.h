//
//  FirstSceneModel.h
//  RSS Reader
//
//  Created by Albert Zhloba on 27.02.22.
//

#import <Foundation/Foundation.h>

@protocol FirstSceneModelProtocol
//    func getWallets(completion: @escaping (Result<[NSManagedObject]?, Error>) -> (Void))
//    func save(name: String, color: String, currency: String)
//    func deleteAllData(entity: String)
@end

@interface FirstSceneModel : NSObject<FirstSceneModelProtocol>

@end

