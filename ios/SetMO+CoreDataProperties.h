//
//  SetMO+CoreDataProperties.h
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SetMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface SetMO (CoreDataProperties)

@property (nonatomic) NSTimeInterval createdAt;
@property (nonatomic) int16_t repCount;
@property (nonatomic) int16_t weight;
@property (nullable, nonatomic, retain) ExerciseMO *exercise;

@end

NS_ASSUME_NONNULL_END
