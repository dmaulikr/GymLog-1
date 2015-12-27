//
//  WorkoutMO.m
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "WorkoutMO.h"
#import "ExerciseMO.h"
#import "DataController.h"

@implementation WorkoutMO

+ (NSString *)entityName {
  return @"Workout";
}
+ (NSFetchRequest *)entityFetchRequest {
  return [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
}

+ (WorkoutMO *)create:(NSDictionary *)attributes {
  WorkoutMO *workout = [NSEntityDescription insertNewObjectForEntityForName:@"Workout" inManagedObjectContext:[DataController sharedController].managedObjectContext];
  [workout update:attributes];
  [[DataController sharedController] persist];
  return workout;
}
- (void)update:(NSDictionary *)attributes {
  NSDate *attrCreatedAt = attributes[@"createdAt"];
  if (attrCreatedAt)
    self.createdAt = [attrCreatedAt timeIntervalSinceReferenceDate];
  NSString *attrLocation = attributes[@"location"];
  if (attrLocation)
    self.location = attrLocation;
  NSDate *attrWorkoutEnd = attributes[@"workoutEnd"];
  if (attrWorkoutEnd)
    self.workoutEnd = [attrWorkoutEnd timeIntervalSinceReferenceDate];
  NSDate *attrWorkoutStart = attributes[@"workoutStart"];
  if (attrWorkoutStart)
    self.workoutStart = [attrWorkoutStart timeIntervalSinceReferenceDate];
}

+ (NSArray *)allWorkouts:(NSError * _Nullable *)error {
  NSFetchRequest *fetchRequest = [self entityFetchRequest];
  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"workoutStart" ascending:NO];
  [fetchRequest setSortDescriptors:@[sortDescriptor]];
  NSArray *fetchedObjects = [[[DataController sharedController] managedObjectContext] executeFetchRequest:fetchRequest error:error];
  return fetchedObjects;
}

@end
