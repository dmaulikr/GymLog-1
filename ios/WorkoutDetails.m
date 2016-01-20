//
//  WorkoutDetails.m
//  GymLog
//
//  Created by Feifan Zhou on 1/3/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "WorkoutDetails.h"

@interface WorkoutDetails()
@property (strong, nonatomic) IBOutlet UILabel *workoutDate;
@property (strong, nonatomic) IBOutlet UILabel *workoutTimeAndPlace;
@end

@implementation WorkoutDetails
+ (WorkoutDetails *)detailsFromWorkout:(WorkoutMO *)workout {
  WorkoutDetails *details = [[[NSBundle mainBundle] loadNibNamed:@"WorkoutDetails" owner:nil options:nil] lastObject];
  if (!details)
    return nil;
  
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"MM/dd/yyyy"];
  details.workoutDate.text = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:workout.workoutStart]];
  
  NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
  timeFormatter.timeStyle = NSDateFormatterShortStyle;
  [timeFormatter setDateFormat:@"HH:mm"];
  NSString *workoutLocationDisplayString = workout.location ? [NSString stringWithFormat:@"• %@", workout.location] : @"";
  details.workoutTimeAndPlace.text = [NSString stringWithFormat:@"%@ – %@ %@",
                                      [timeFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:workout.workoutStart]],
                                      [timeFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:workout.workoutEnd]],
                                      workoutLocationDisplayString
                                      ];
  
  return details;
}
@end
