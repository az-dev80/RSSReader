//
//  LoadingIndicator.m
//  RSS Reader
//
//  Created by Albert Zhloba on 3.05.22.
//

#import "LoadingIndicator.h"

@implementation LoadingIndicator

+(LoadingIndicator *)shared {
    static LoadingIndicator *shared = nil;
    @synchronized(self) {
        if (shared == nil) {
            shared = [[self alloc] init];
        }
    }
    return shared;
}

-(void)show:(UIView *)view {
    //dispatch_async(dispatch_get_main_queue(), ^{
        view.userInteractionEnabled = NO;
        loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        loadingView.center = view.center;
        //loadingView.backgroundColor = UIColor.darkGrayColor;
        loadingView.clipsToBounds = YES;
        loadingView.layer.cornerRadius = 10.0;
        
        activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleLarge;
        activityIndicator.center = CGPointMake(loadingView.frame.size.width / 2, loadingView.frame.size.width / 2);
        activityIndicator.hidesWhenStopped = YES;
        [loadingView addSubview:activityIndicator];
        [view addSubview:self->loadingView];
        [activityIndicator startAnimating];
    //});
}

-(void)hide:(UIView *)view {
    if ([loadingView isDescendantOfView:view]) {
        //dispatch_async(dispatch_get_main_queue(), ^{
            view.userInteractionEnabled = YES;
            [self->activityIndicator stopAnimating];
            [self->loadingView removeFromSuperview];
        //});
    } else {
        // add a short delay in case hide was called before the view appeared
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            if ([self->loadingView isDescendantOfView:view]) {
                view.userInteractionEnabled = YES;
                [self->activityIndicator stopAnimating];
                [self->loadingView removeFromSuperview];
            }
        });
    }
}

@end
