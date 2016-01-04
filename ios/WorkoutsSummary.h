//
//  WorkoutsSummary.h
//  GymLog
//
//  Created by Feifan Zhou on 1/3/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkoutsSummary : UIView
+ (WorkoutsSummary *)summaryViewFromWorkouts:(NSArray *)workouts;
@end
