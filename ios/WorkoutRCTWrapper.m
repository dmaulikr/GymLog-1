//
//  WorkoutRCTWrapper.m
//  GymLog
//
//  Created by Feifan Zhou on 12/27/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "WorkoutRCTWrapper.h"
#import "WorkoutMO.h"

@implementation WorkoutRCTWrapper
RCT_EXPORT_MODULE(Workout);

RCT_EXPORT_METHOD(fetchAllWorkouts:(RCTResponseSenderBlock)callback) {
  NSError *error;
  NSArray *workouts = [WorkoutMO allWorkouts:&error];
  id callbackError = error;
  if (!callbackError)
    callbackError = [NSNull null];
  callback(@[callbackError, workouts]);
}

RCT_EXPORT_METHOD(registerNewWorkout:(RCTResponseSenderBlock)callback) {
  WorkoutMO *newWorkout = [WorkoutMO create:@{@"createdAt": [NSDate date]}];
  // TODO: Track errors on create
  callback(@[[NSNull null], [newWorkout asJSON]]);
}

@end
