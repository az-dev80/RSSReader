//
//  Loader.h
//  RSS Reader
//
//  Created by Albert Zhloba on 4.05.22.
//

#import <Foundation/Foundation.h>

@protocol LoaderProtocol <NSObject>
-(NSData *)loadDataWithURL:(NSURL *)url andError:(NSError **)error;
@end

@interface Loader : NSObject <LoaderProtocol>

@end
