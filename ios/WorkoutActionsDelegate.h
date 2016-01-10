//
//  WorkoutActionsDelegate.h
//  GymLog
//
//  Created by Feifan Zhou on 1/5/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#ifndef WorkoutActionsDelegate_h
#define WorkoutActionsDelegate_h

@protocol WorkoutActionsDelegate <NSObject>

@optional
- (void)didSelectAddExercise;
- (void)didSelectFinishExercise;
@end

#endif /* WorkoutActionsDelegate_h */
