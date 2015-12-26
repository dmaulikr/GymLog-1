//
//  WorkoutMO.m
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "WorkoutMO.h"
#import "DataController.h"

@implementation WorkoutMO
@dynamic createdAt;
@dynamic location;
@dynamic workoutEnd;
@dynamic workoutStart;

+ (WorkoutMO *)create:(NSDictionary *)attributes {
  WorkoutMO *workout = [NSEntityDescription insertNewObjectForEntityForName:@"Workout" inManagedObjectContext:[DataController sharedController].managedObjectContext];
  [workout update:attributes];
  [[DataController sharedController] persist];
  return workout;
}
- (void)update:(NSDictionary *)attributes {
  NSDate *attrCreatedAt = attributes[@"createdAt"];
  if (attrCreatedAt)
    self.createdAt = attrCreatedAt;
  NSString *attrLocation = attributes[@"location"];
  if (attrLocation)
    self.location = attrLocation;
  NSDate *attrWorkoutEnd = attributes[@"workoutEnd"];
  if (attrWorkoutEnd)
    self.workoutEnd = attrWorkoutEnd;
  NSDate *attrWorkoutStart = attributes[@"workoutStart"];
  if (attrWorkoutStart)
    self.workoutStart = attrWorkoutStart;
}
@end
