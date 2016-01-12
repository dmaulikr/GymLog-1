//
//  SetMO.h
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ExerciseMO;

NS_ASSUME_NONNULL_BEGIN

@interface SetMO : NSManagedObject

+ (NSString *)entityName;
+ (SetMO *)create:(NSDictionary *)attributes;
- (void)update:(NSDictionary *)attributes save:(BOOL)shouldSave;

- (NSDictionary *)asJSON;

@end

NS_ASSUME_NONNULL_END

#import "SetMO+CoreDataProperties.h"
