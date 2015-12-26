//
//  SetMO.m
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "SetMO.h"
#import "ExerciseMO.h"
#import "DataController.h"

@implementation SetMO

+ (NSString *)entityName {
  return @"Set";
}
+ (NSFetchRequest *)entityFetchRequest {
  return [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
}

+ (SetMO *)create:(NSDictionary *)attributes {
  SetMO *set = [NSEntityDescription insertNewObjectForEntityForName:@"Set" inManagedObjectContext:[DataController sharedController].managedObjectContext];
  [set update:attributes];
  [[DataController sharedController] persist];
  return set;
}
- (void)update:(NSDictionary *)attributes {
  NSDate *attrCreatedAt = attributes[@"createdAt"];
  if (attrCreatedAt)
    self.createdAt = [attrCreatedAt timeIntervalSinceReferenceDate];
  NSNumber *attrRepCount = attributes[@"repCount"];
  if (attrRepCount)
    self.repCount = [attrRepCount shortValue];
  NSNumber *attrWeight = attributes[@"weights"];
  if (attrWeight)
    self.weight = [attrWeight shortValue];
}

@end
