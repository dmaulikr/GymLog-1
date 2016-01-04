//
//  WorkoutDetails.h
//  GymLog
//
//  Created by Feifan Zhou on 1/3/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutMO.h"

@interface WorkoutDetails : UIView
+ (WorkoutDetails *)detailsFromWorkout:(WorkoutMO *)workout;
@end
