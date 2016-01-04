//
//  WorkoutsSummary.m
//  GymLog
//
//  Created by Feifan Zhou on 1/3/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "WorkoutsSummary.h"
#import "WorkoutMO.h"

@interface WorkoutsSummary()
@property (strong, nonatomic) IBOutlet UILabel *durationLabel;
@end

@implementation WorkoutsSummary
+ (WorkoutsSummary *)summaryViewFromWorkouts:(NSArray *)workouts {
  WorkoutsSummary *summary = [[[NSBundle mainBundle] loadNibNamed:@"WorkoutsSummary" owner:nil options:nil] lastObject];
  if (!summary)
    return nil;
  
  int totalDuration = 0;
  for (WorkoutMO *workout in workouts)
    totalDuration += ((int)workout.workoutEnd - (int)workout.workoutStart);
  int totalHours = totalDuration / 3600;
  int totalMinutes = (totalDuration - totalHours * 3600) / 60;
  summary.durationLabel.text = [NSString stringWithFormat:@"%dh %dm", totalHours, totalMinutes];
  
  return summary;
}
@end
