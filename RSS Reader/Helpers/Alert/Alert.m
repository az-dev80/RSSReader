//
//  Alert.m
//  RSS Reader
//
//  Created by Albert Zhloba on 4.05.22.
//

#import "Alert.h"

@implementation Alert

+(UIAlertController *)alertWithMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [alert addAction:cancelAction];
    
    return alert;
}

@end
