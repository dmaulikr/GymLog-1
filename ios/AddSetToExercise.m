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
@property (strong, nonatomic) IBOutlet UIButton *addSetButton;

- (IBAction)addSet:(id)sender;
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
  
  // Draw border below cell
  bottomBorder = [CALayer layer];
  bottomBorder.frame = CGRectMake(20, 44.0f - 0.5, 1000.0f, 0.5f);
  bottomBorder.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.15f].CGColor;
  [addSetCell.layer addSublayer:bottomBorder];
  
  addSetCell.selectionStyle = UITableViewCellSelectionStyleNone;
  
  return addSetCell;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [[event allTouches] anyObject];
  if (CGRectContainsPoint(self.repsField.frame, [touch locationInView:self]))
    [self.repsField becomeFirstResponder];
  else if (CGRectContainsPoint(self.weightField.frame, [touch locationInView:self]))
    [self.weightField becomeFirstResponder];
  else if (CGRectContainsPoint(self.addSetButton.frame, [touch locationInView:self]))
    [self addSet:self.addSetButton];
}

- (IBAction)addSet:(id)sender {
  if (self.delegate && [self.delegate respondsToSelector:@selector(addReps:atWeight:)]) {
    NSInteger repsCount = [self.repsField.text integerValue];
    float weight = [self.weightField.text floatValue];
    [self.delegate addReps:repsCount atWeight:weight];
  }
}

- (void)focus {
  [self.repsField becomeFirstResponder];
}
@end
