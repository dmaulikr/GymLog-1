//
//  WorkoutDetailsViewController.h
//  GymLog
//
//  Created by Feifan Zhou on 1/3/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutMO.h"
#import "WorkoutActionsDelegate.h"
#import "AddExerciseDelegate.h"

@interface WorkoutDetailsViewController : UIViewController <WorkoutActionsDelegate, AddExerciseDelegate>
+ (WorkoutDetailsViewController *)detailsForWorkout:(WorkoutMO *)workout;
@end
