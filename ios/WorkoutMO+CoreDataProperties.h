//
//  WorkoutMO+CoreDataProperties.h
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "WorkoutMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface WorkoutMO (CoreDataProperties)

@property (nonatomic) NSTimeInterval createdAt;
@property (nonatomic) NSTimeInterval workoutStart;
@property (nonatomic) NSTimeInterval workoutEnd;
@property (nullable, nonatomic, retain) NSString *location;
@property (nullable, nonatomic, retain) NSOrderedSet<ExerciseMO *> *exercises;

@end

@interface WorkoutMO (CoreDataGeneratedAccessors)

- (void)insertObject:(ExerciseMO *)value inExercisesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromExercisesAtIndex:(NSUInteger)idx;
- (void)insertExercises:(NSArray<ExerciseMO *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeExercisesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInExercisesAtIndex:(NSUInteger)idx withObject:(ExerciseMO *)value;
- (void)replaceExercisesAtIndexes:(NSIndexSet *)indexes withExercises:(NSArray<ExerciseMO *> *)values;
- (void)addExercisesObject:(ExerciseMO *)value;
- (void)removeExercisesObject:(ExerciseMO *)value;
- (void)addExercises:(NSOrderedSet<ExerciseMO *> *)values;
- (void)removeExercises:(NSOrderedSet<ExerciseMO *> *)values;

@end

NS_ASSUME_NONNULL_END
