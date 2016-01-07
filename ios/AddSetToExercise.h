//
//  AddSetToExercise.h
//  GymLog
//
//  Created by Feifan Zhou on 1/5/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddSetDelegate.h"

@interface AddSetToExercise : UITableViewCell
@property (weak, nonatomic) id<AddSetDelegate> delegate;

+ (AddSetToExercise *)addSetCell;
@end
