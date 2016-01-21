//
//  EditWorkout.m
//  GymLog
//
//  Created by Feifan Zhou on 1/20/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "EditWorkout.h"

@interface EditWorkout()
@property (strong, nonatomic) IBOutlet UIDatePicker *workoutStartPicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *workoutEndPicker;
@property (strong, nonatomic) WorkoutMO *workout;

- (IBAction)setWorkoutStartTime:(UIDatePicker *)sender;
- (IBAction)setWorkoutEndTime:(UIDatePicker *)sender;
@end

@implementation EditWorkout
+ (EditWorkout *)editWorkout:(WorkoutMO *)workout {
  EditWorkout *view = [[[NSBundle mainBundle] loadNibNamed:@"EditWorkout" owner:nil options:nil] lastObject];
  if (!view)
    return nil;
  view.workout = workout;
  
  view.workoutStartPicker.date = [NSDate dateWithTimeIntervalSince1970:workout.workoutStart];
  view.workoutEndPicker.date = [NSDate dateWithTimeIntervalSince1970:workout.workoutEnd];
    
  return view;
}

- (IBAction)setWorkoutStartTime:(UIDatePicker *)sender {
  [self.workout update:@{@"workoutStart": sender.date} save:YES];
}

- (IBAction)setWorkoutEndTime:(UIDatePicker *)sender {
  [self.workout update:@{@"workoutEnd": sender.date} save:YES];
}
@end
