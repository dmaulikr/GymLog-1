//
//  WorkoutMO+CoreDataProperties.m
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "WorkoutMO+CoreDataProperties.h"

@implementation WorkoutMO (CoreDataProperties)

@dynamic uid;
@dynamic createdAt;
@dynamic workoutStart;
@dynamic workoutEnd;
@dynamic location;
@dynamic exercises;

- (NSTimeInterval)workoutStart {
  NSTimeInterval currentWorkoutStart = [(NSDate *)[self primitiveValueForKey:@"workoutStart"] timeIntervalSinceReferenceDate];
  if (currentWorkoutStart > 0)
    return currentWorkoutStart;
  else
    return self.createdAt;
}

- (NSTimeInterval)workoutEnd {
  NSTimeInterval currentWorkoutEnd = [(NSDate *)[self primitiveValueForKey:@"workoutEnd"] timeIntervalSinceReferenceDate];
  if (currentWorkoutEnd > 0)
    return currentWorkoutEnd;
  else
    return self.createdAt;
}

@end
