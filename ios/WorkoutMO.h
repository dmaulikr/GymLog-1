//
//  WorkoutMO.h
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ExerciseMO;

NS_ASSUME_NONNULL_BEGIN

@interface WorkoutMO : NSManagedObject

+ (NSString *)entityName;
+ (WorkoutMO *)create:(NSDictionary *)attributes;
- (void)update:(NSDictionary *)attributes;

- (NSArray *)allWorkouts;
- (void)addExercisesObject:(ExerciseMO *)exercise;

@end

NS_ASSUME_NONNULL_END

#import "WorkoutMO+CoreDataProperties.h"