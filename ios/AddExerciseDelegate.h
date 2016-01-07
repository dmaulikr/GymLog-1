//
//  AddExerciseDelegate.h
//  GymLog
//
//  Created by Feifan Zhou on 1/6/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#ifndef AddExerciseDelegate_h
#define AddExerciseDelegate_h

#import "ExerciseMO.h"

@protocol AddExerciseDelegate <NSObject>

@optional
- (void)didCancelAddingExercise:(ExerciseMO *)exercise;
- (void)didFinishAddingExercise:(ExerciseMO *)exercise;

@end

#endif /* AddExerciseDelegate_h */
