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

+ (NSDate *)firstDayOfWeekFrom:(NSDate *)givenDate;
@end

@implementation WorkoutsSummary
+ (WorkoutsSummary *)summaryViewFromWorkouts:(NSArray *)workouts {
  WorkoutsSummary *summary = [[[NSBundle mainBundle] loadNibNamed:@"WorkoutsSummary" owner:nil options:nil] lastObject];
  if (!summary)
    return nil;
  
  int totalDuration = 0;
  NSTimeInterval weekStart = [[self firstDayOfWeekFrom:[NSDate date]] timeIntervalSince1970];
  for (WorkoutMO *workout in workouts)
    if (workout.workoutStart >= weekStart)
      totalDuration += ((int)workout.workoutEnd - (int)workout.workoutStart);
  int totalHours = totalDuration / 3600;
  int totalMinutes = (totalDuration - totalHours * 3600) / 60;
  summary.durationLabel.text = [NSString stringWithFormat:@"%dh %dm", totalHours, totalMinutes];
  
  return summary;
}

+ (NSDate *)firstDayOfWeekFrom:(NSDate *)givenDate {
  NSCalendar *calendar = [NSCalendar currentCalendar];
  
  NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:givenDate];
  [components setWeekday:1]; // 1 == Sunday, 7 == Saturday
  [components setWeekOfYear:[components weekOfYear]];
  
  return [calendar dateFromComponents:components];
}

@end
