//
//  WorkoutActions.h
//  GymLog
//
//  Created by Feifan Zhou on 1/3/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutActionsDelegate.h"

@interface WorkoutActions : UIView
@property (weak, nonatomic) id<WorkoutActionsDelegate> delegate;
+ (WorkoutActions *)workoutActions;
@end
