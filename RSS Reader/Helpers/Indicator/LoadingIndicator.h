//
//  LoadingIndicator.h
//  RSS Reader
//
//  Created by Albert Zhloba on 3.05.22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoadingIndicator : NSObject {
    UIView *loadingView;
    UIActivityIndicatorView *activityIndicator;
}

+(LoadingIndicator *)shared;
-(void)show:(UIView*)view;
-(void)hide:(UIView*)view;

@end

NS_ASSUME_NONNULL_END
