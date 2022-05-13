//
//  Alert.h
//  RSS Reader
//
//  Created by Albert Zhloba on 4.05.22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Alert : NSObject
+(UIAlertController *)alertWithMessage:(NSString *)message;
@end

