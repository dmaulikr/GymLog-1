//
//  DataController.h
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface DataController : NSObject

@property (strong) NSManagedObjectContext *managedObjectContext;

+ (DataController *)sharedController;
- (void)persist;
- (void)deleteObject:(NSManagedObject *)object;
@end
