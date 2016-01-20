//
//  ExerciseMO.m
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "ExerciseMO.h"
#import "SetMO.h"
#import "WorkoutMO.h"
#import "DataController.h"

@implementation ExerciseMO

+ (NSString *)entityName {
  return @"Exercise";
}
+ (NSFetchRequest *)entityFetchRequest {
  return [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
}

+ (ExerciseMO *)newInstance:(NSDictionary *)attributes {
  ExerciseMO *exercise = [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:[DataController sharedController].managedObjectContext];
  exercise.uid = [NSDate timeIntervalSinceReferenceDate];
  exercise.workout = attributes[@"workout"];
  [exercise update:attributes save:NO];
  return exercise;
}

+ (ExerciseMO *)create:(NSDictionary *)attributes {
  ExerciseMO *exercise = [self newInstance:attributes];
  [[DataController sharedController] persist];
  return exercise;
}

- (void)update:(NSDictionary *)attributes save:(BOOL)shouldSave {
  NSDate *attrCreatedAt = attributes[@"createdAt"];
  if (attrCreatedAt)
    self.createdAt = [attrCreatedAt timeIntervalSince1970];
  NSString *attrName = attributes[@"name"];
  if (attrName)
    self.name = attrName;
  NSString *attrNotes = attributes[@"notes"];
  if (attrNotes)
    self.notes = attrNotes;
  
  if (shouldSave)
    [[DataController sharedController] persist];
}

- (NSDictionary *)asJSON {
  NSMutableArray *setsJSON = [NSMutableArray arrayWithCapacity:[self.sets count]];
  for (SetMO *set in self.sets)
    [setsJSON addObject:[set asJSON]];
  return @{
           @"uid": @(self.uid),
           @"createdAt": @(self.createdAt),
           @"name": self.name ? self.name : @"",
           @"notes": self.notes ? self.notes : @"",
           @"sets": setsJSON
           };
}

+ (id)find:(uint64_t)uid error:(NSError * _Nullable *)error {
  NSFetchRequest *fetchRequest = [self entityFetchRequest];
  [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"uid == %li", uid]];
  NSArray *fetchedObjects = [[[DataController sharedController] managedObjectContext] executeFetchRequest:fetchRequest error:error];
  return fetchedObjects[0];
}

+ (id)findByName:(NSString *)name error:(NSError * _Nullable *)error {
  NSFetchRequest *fetchRequest = [self entityFetchRequest];
  [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name == %@", name]];
  fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:NO]];
  NSArray *fetchedObjects = [[[DataController sharedController] managedObjectContext] executeFetchRequest:fetchRequest error:error];
  return fetchedObjects;
}

- (NSArray<SetMO *> *)sortedSets {
  return [(NSSet<SetMO *> *)[self primitiveValueForKey:@"sets"] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:YES]]];
}

+ (NSArray *)exerciseNames {
  NSFetchRequest *request = [self.class entityFetchRequest];
  [request setResultType:NSDictionaryResultType];
  [request setReturnsDistinctResults:YES];
  [request setPropertiesToFetch:@[@"name"]];
  
  NSError *error;
  NSArray *objects = [[[DataController sharedController] managedObjectContext] executeFetchRequest:request error:&error];
  // TODO: Handle error
  
  NSMutableArray *names = [NSMutableArray arrayWithCapacity:[objects count]];
  for (NSDictionary *exercise in objects)
    [names addObject:exercise[@"name"]];
  return names;
}

@end
