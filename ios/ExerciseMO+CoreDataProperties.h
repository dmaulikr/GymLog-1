//
//  ExerciseMO+CoreDataProperties.h
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ExerciseMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExerciseMO (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nonatomic) NSTimeInterval createdAt;
@property (nullable, nonatomic, retain) NSString *notes;
@property (nullable, nonatomic, retain) WorkoutMO *workout;
@property (nullable, nonatomic, retain) NSSet<SetMO *> *sets;

@end

@interface ExerciseMO (CoreDataGeneratedAccessors)

- (void)addSetsObject:(SetMO *)value;
- (void)removeSetsObject:(SetMO *)value;
- (void)addSets:(NSSet<SetMO *> *)values;
- (void)removeSets:(NSSet<SetMO *> *)values;

@end

NS_ASSUME_NONNULL_END
