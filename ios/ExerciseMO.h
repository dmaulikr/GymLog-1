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
- (void)update:(NSDictionary *)attributes save:(BOOL)shouldSave;

+ (id)find:(uint64_t)uid error:(NSError * _Nullable *)error;

- (NSDictionary *)asJSON;
- (NSArray<SetMO *> *)sortedSets;

@end

NS_ASSUME_NONNULL_END

#import "ExerciseMO+CoreDataProperties.h"
