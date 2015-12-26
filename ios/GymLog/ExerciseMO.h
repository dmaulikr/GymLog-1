//
//  ExerciseMO.h
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface ExerciseMO : NSManagedObject
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *notes;

+ (ExerciseMO *)create:(NSDictionary *)attributes;
- (void)update:(NSDictionary *)attributes;
@end
