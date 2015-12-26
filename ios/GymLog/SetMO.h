//
//  SetMO.h
//  GymLog
//
//  Created by Feifan Zhou on 12/26/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface SetMO : NSManagedObject
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSNumber *repCount;
@property (nonatomic, strong) NSNumber *weight;
@end
