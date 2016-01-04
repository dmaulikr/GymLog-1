//
//  WorkoutActions.m
//  GymLog
//
//  Created by Feifan Zhou on 1/3/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "WorkoutActions.h"

@implementation WorkoutActions
+ (WorkoutActions *)workoutActions {
  WorkoutActions *actions = [[[NSBundle mainBundle] loadNibNamed:@"WorkoutActions" owner:nil options:nil] lastObject];
  if (!actions)
    return nil;
  
  return actions;
}
@end
