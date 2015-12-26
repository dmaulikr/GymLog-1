//
//  SetMO.m
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "SetMO.h"
#import "DataController.h"

@implementation SetMO
@dynamic createdAt;
@dynamic repCount;
@dynamic weight;

+ (SetMO *)create:(NSDictionary *)attributes {
  SetMO *set = [NSEntityDescription insertNewObjectForEntityForName:@"Set" inManagedObjectContext:[DataController sharedController].managedObjectContext];
  [set update:attributes];
  [[DataController sharedController] persist];
  return set;
}
- (void)update:(NSDictionary *)attributes {
  NSDate *attrCreatedAt = attributes[@"createdAt"];
  if (attrCreatedAt)
    self.createdAt = attrCreatedAt;
  NSNumber *attrRepCount = attributes[@"repCount"];
  if (attrRepCount)
    self.repCount = attrRepCount;
  NSNumber *attrWeight = attributes[@"weights"];
  if (attrWeight)
    self.weight = attrWeight;
}
@end
