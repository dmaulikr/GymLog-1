//
//  WorkoutRCTWrapper.m
//  GymLog
//
//  Created by Feifan Zhou on 12/27/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "WorkoutRCTWrapper.h"
#import "WorkoutMO.h"
#import "ExerciseMO.h"

@implementation WorkoutRCTWrapper
RCT_EXPORT_MODULE(Workout);

RCT_EXPORT_METHOD(fetchAllWorkouts:(RCTResponseSenderBlock)callback) {
  NSError *error;
  NSArray *workouts = [WorkoutMO allWorkouts:&error];
  NSMutableArray *workoutsJSON = [NSMutableArray arrayWithCapacity:[workouts count]];
  for (int i = 0; i < [workouts count]; i++)
    [workoutsJSON addObject:[workouts[i] asJSON]];
  id callbackError = error;
  if (!callbackError)
    callbackError = [NSNull null];
  callback(@[callbackError, workoutsJSON]);
}

RCT_EXPORT_METHOD(registerNewWorkout:(RCTResponseSenderBlock)callback) {
  WorkoutMO *newWorkout = [WorkoutMO create:@{@"createdAt": [NSDate date]}];
  // TODO: Track errors on create
  callback(@[[NSNull null], [newWorkout asJSON]]);
}

RCT_EXPORT_METHOD(registerExercise:(NSDictionary *)workoutJSON callback:(RCTResponseSenderBlock)callback) {
  NSError *error;
  id instance = [WorkoutMO find:[workoutJSON[@"uid"] longValue] error:&error];
  if (error) {
    callback(@[error, [NSNull null], [NSNull null]]);
    return;
  }
  WorkoutMO *workout = (WorkoutMO *)instance;
  ExerciseMO *exercise = [ExerciseMO newInstance:@{@"createdAt": [NSDate date], @"workout": workout}];
  callback(@[[NSNull null], [exercise asJSON], [workout asJSON]]);
}

@end
