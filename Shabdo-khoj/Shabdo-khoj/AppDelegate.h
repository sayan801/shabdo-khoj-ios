//
//  AppDelegate.h
//  Shabdo-khoj
//
//  Created by technicise on 4/28/15.
//  Copyright (c) 2015 technicise.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ViewController.h"
@class ViewController;
NSMutableArray *tableData;
NSMutableArray *fileName;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) ViewController *ViewController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

