//
//  ExerciseMO.h
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SetMO, WorkoutMO;

NS_ASSUME_NONNULL_BEGIN

@interface ExerciseMO : NSManagedObject

+ (NSString *)entityName;
+ (ExerciseMO *)newInstance:(NSDictionary *)attributes;
+ (ExerciseMO *)create:(NSDictionary *)attributes;
- (void)update:(NSDictionary *)attributes;

- (NSDictionary *)asJSON;

@end

NS_ASSUME_NONNULL_END

#import "ExerciseMO+CoreDataProperties.h"
