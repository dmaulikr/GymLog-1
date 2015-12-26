//
//  WorkoutMO.h
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface WorkoutMO : NSManagedObject
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSDate *workoutEnd;
@property (nonatomic, strong) NSDate *workoutStart;
@end
