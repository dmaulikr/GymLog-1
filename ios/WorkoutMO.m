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
//  [[DataController sharedController] persist];
  return workout;
}
- (void)update:(NSDictionary *)attributes {
  NSDate *attrCreatedAt = attributes[@"createdAt"];
  if (attrCreatedAt)
    self.createdAt = [attrCreatedAt timeIntervalSince1970];
  NSString *attrLocation = attributes[@"location"];
  if (attrLocation)
    self.location = attrLocation;
  NSDate *attrWorkoutEnd = attributes[@"workoutEnd"];
  if (attrWorkoutEnd)
    self.workoutEnd = [attrWorkoutEnd timeIntervalSince1970];
  NSDate *attrWorkoutStart = attributes[@"workoutStart"];
  if (attrWorkoutStart)
    self.workoutStart = [attrWorkoutStart timeIntervalSince1970];
}

- (NSDictionary *)asJSON {
  NSLog(@"Created at: %f", self.createdAt);
  return @{
            @"createdAt": @(self.createdAt),
            @"duration": @3720,
            @"location": self.location ? self.location : @"Unknown location"
          };
}

+ (NSArray *)allWorkouts:(NSError * _Nullable *)error {
  NSFetchRequest *fetchRequest = [self entityFetchRequest];
  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"workoutStart" ascending:NO];
  [fetchRequest setSortDescriptors:@[sortDescriptor]];
  NSArray *fetchedObjects = [[[DataController sharedController] managedObjectContext] executeFetchRequest:fetchRequest error:error];
  return fetchedObjects;
}

@end
