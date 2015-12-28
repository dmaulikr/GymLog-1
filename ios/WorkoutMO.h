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
- (NSDictionary *)asJSON;

+ (NSArray *)allWorkouts:(NSError * _Nullable *)error;
+ (id)find:(uint64_t)uid error:(NSError * _Nullable *)error;

@end

NS_ASSUME_NONNULL_END

#import "WorkoutMO+CoreDataProperties.h"
