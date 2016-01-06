//
//  WorkoutActions.m
//  GymLog
//
//  Created by Feifan Zhou on 1/3/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "WorkoutActions.h"
@import QuartzCore;

@interface WorkoutActions()
- (IBAction)addExercise:(id)sender;
@end

@implementation WorkoutActions
@synthesize delegate;

+ (WorkoutActions *)workoutActions {
  WorkoutActions *actions = [[[NSBundle mainBundle] loadNibNamed:@"WorkoutActions" owner:nil options:nil] lastObject];
  if (!actions)
    return nil;
  
  return actions;
}

- (IBAction)addExercise:(id)sender {
  if ([self.delegate respondsToSelector:@selector(didSelectAddExercise)])
    [self.delegate didSelectAddExercise];
}
@end
