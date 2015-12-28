//
//  ExerciseRCTWrapper.m
//  GymLog
//
//  Created by Feifan Zhou on 12/27/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "ExerciseRCTWrapper.h"
#import "ExerciseMO.h"
#import "SetMO.h"

@implementation ExerciseRCTWrapper
RCT_EXPORT_MODULE(Exercise);

RCT_EXPORT_METHOD(addSet:(NSDictionary *)setJSON toExercise:(NSDictionary *)exerciseJSON callback:(RCTResponseSenderBlock)callback) {
  NSError *error;
  id instance = [ExerciseMO find:[exerciseJSON[@"uid"] longValue] error:&error];
  if (error) {
    callback(@[error, [NSNull null], [NSNull null]]);
    return;
  }
  ExerciseMO *exercise = (ExerciseMO *)instance;
  NSMutableDictionary *setParams = [NSMutableDictionary dictionaryWithDictionary:setJSON];
  setParams[@"createdAt"] = [NSDate date];
  setParams[@"exercise"] = exercise;
  SetMO *set = [SetMO create:setParams];
  callback(@[[NSNull null], [set asJSON], [exercise asJSON]]);
}
@end
