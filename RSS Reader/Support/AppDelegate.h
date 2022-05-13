//
//  AppDelegate.h
//  RSS Reader
//
//  Created by Albert Zhloba on 27.01.22.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, retain) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

