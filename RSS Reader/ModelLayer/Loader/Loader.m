//
//  Loader.m
//  RSS Reader
//
//  Created by Albert Zhloba on 4.05.22.
//

#import "Loader.h"

@implementation Loader

- (NSData *)loadDataWithURL:(NSURL *)url andError:(NSError **)error {
    NSURL *copyURL = [url copy];
    NSData *data = [NSData dataWithContentsOfURL:copyURL options:NSDataReadingUncached error:error];
    
    return data;
   }

@end
