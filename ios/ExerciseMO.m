//
//  ExerciseMO.m
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "ExerciseMO.h"
#import "SetMO.h"
#import "WorkoutMO.h"
#import "DataController.h"

@implementation ExerciseMO

+ (NSString *)entityName {
  return @"Exercise";
}
+ (NSFetchRequest *)entityFetchRequest {
  return [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
}

+ (ExerciseMO *)create:(NSDictionary *)attributes {
  ExerciseMO *exercise = [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:[DataController sharedController].managedObjectContext];
  [exercise update:attributes];
  [[DataController sharedController] persist];
  return exercise;
}

- (void)update:(NSDictionary *)attributes {
  NSDate *attrCreatedAt = attributes[@"createdAt"];
  if (attrCreatedAt)
    self.createdAt = [attrCreatedAt timeIntervalSince1970];
  NSString *attrName = attributes[@"name"];
  if (attrName)
    self.name = attrName;
  NSString *attrNotes = attributes[@"notes"];
  if (attrNotes)
    self.notes = attrNotes;
}

@end
