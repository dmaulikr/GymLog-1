//
//  AddSetToExercise.m
//  GymLog
//
//  Created by Feifan Zhou on 1/5/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "AddSetToExercise.h"
@import QuartzCore;

@interface AddSetToExercise()
@property (strong, nonatomic) IBOutlet UITextField *repsField;
@property (strong, nonatomic) IBOutlet UITextField *weightField;
@end

@implementation AddSetToExercise
+ (AddSetToExercise *)addSetCell {
  AddSetToExercise *addSetCell = [[[NSBundle mainBundle] loadNibNamed:@"AddSetToExercise" owner:nil options:nil] lastObject];
  if (!addSetCell)
    return nil;
  
  // Draw border below name field
  CALayer *bottomBorder = [CALayer layer];
  bottomBorder.frame = CGRectMake(0, addSetCell.repsField.frame.size.height - 1, addSetCell.repsField.frame.size.width, 1.0f);
  bottomBorder.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1f].CGColor;
  [addSetCell.repsField.layer addSublayer:bottomBorder];
  
  bottomBorder = [CALayer layer];
  bottomBorder.frame = CGRectMake(0, addSetCell.weightField.frame.size.height - 1, addSetCell.weightField.frame.size.width, 1.0f);
  bottomBorder.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1f].CGColor;
  [addSetCell.weightField.layer addSublayer:bottomBorder];
  
  return addSetCell;
}
@end
