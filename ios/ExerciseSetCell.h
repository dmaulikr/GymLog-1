//
//  ExerciseSetCell.h
//  GymLog
//
//  Created by Feifan Zhou on 1/6/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetMO.h"

@interface ExerciseSetCell : UITableViewCell
+ (ExerciseSetCell *)cellForSet:(SetMO *)set;
@end
