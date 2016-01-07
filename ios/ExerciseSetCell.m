//
//  ExerciseSetCell.m
//  GymLog
//
//  Created by Feifan Zhou on 1/6/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "ExerciseSetCell.h"

@interface ExerciseSetCell()
@property (strong, nonatomic) IBOutlet UILabel *setLabel;
@end

@implementation ExerciseSetCell
+ (ExerciseSetCell *)cellForSet:(SetMO *)set {
  ExerciseSetCell *exerciseSetCell = [[[NSBundle mainBundle] loadNibNamed:@"ExerciseSetCell" owner:nil options:nil] lastObject];
  if (!exerciseSetCell)
    return nil;
  
  exerciseSetCell.selectionStyle = UITableViewCellSelectionStyleNone;
  
  NSString *setString = [NSString stringWithFormat:@"%d @ %d", set.repCount, set.weight];
  exerciseSetCell.setLabel.text = setString;
  
  return exerciseSetCell;
}
@end
