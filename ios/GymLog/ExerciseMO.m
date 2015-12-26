//
//  ExerciseMO.m
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "ExerciseMO.h"
#import "DataController.h"

@implementation ExerciseMO
@dynamic createdAt;
@dynamic name;
@dynamic notes;

+ (ExerciseMO *)create:(NSDictionary *)attributes {
  ExerciseMO *exercise = [NSEntityDescription insertNewObjectForEntityForName:@"Exercise" inManagedObjectContext:[DataController sharedController].managedObjectContext];
  [exercise update:attributes];
  [[DataController sharedController] persist];
  return exercise;
}

- (void)update:(NSDictionary *)attributes {
  NSDate *attrCreatedAt = attributes[@"createdAt"];
  if (attrCreatedAt)
    self.createdAt = attrCreatedAt;
  NSString *attrName = attributes[@"name"];
  if (attrName)
    self.name = attrName;
  NSString *attrNotes = attributes["notes"];
  if (attrNotes)
    self.notes = attrNotes;
}
@end
