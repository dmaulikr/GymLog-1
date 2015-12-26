//
//  DataController.m
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "DataController.h"

@interface DataController()
- (void)initializeCoreData;
@end

@implementation DataController

static DataController *_sharedController = nil;
+ (DataController *)sharedController {
  if (!_sharedController)
    _sharedController = [[DataController alloc] init];
  return _sharedController;
}

- (id)init {
  if (!(self = [super init]))
    return nil;
  
  [self initializeCoreData];
  return self;
}

// https://developer.apple.com/library/tvos/documentation/Cocoa/Conceptual/CoreData/InitializingtheCoreDataStack.html#//apple_ref/doc/uid/TP40001075-CH4-SW1
- (void)initializeCoreData {
  NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"GymLog" withExtension:@"xcdatamodeld"];
  NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
  NSAssert(mom != nil, @"Error initializing Managed Object Model");
  
  NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
  NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
  [moc setPersistentStoreCoordinator:psc];
  [self setManagedObjectContext:moc];
  NSFileManager *fileManager = [NSFileManager defaultManager];
  NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
  NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"DataModel.sqlite"];
  
  dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
    NSError *error = nil;
    NSPersistentStoreCoordinator *psc = [[self managedObjectContext] persistentStoreCoordinator];
    NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
  });
}

- (void)persist {
  NSError *error = nil;
  if ([[self managedObjectContext] save:&error] == NO) {
    NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
  }
}
@end
