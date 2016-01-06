//
//  AddExerciseViewController.m
//  GymLog
//
//  Created by Feifan Zhou on 1/4/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "AddExerciseViewController.h"
@import QuartzCore;
#import "TitleDetailCell.h"
#import "AddSetToExercise.h"

@interface AddExerciseViewController()
@property (strong, nonatomic) IBOutlet UITextField *exerciseNameField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) BOOL isEditingExerciseName;
@property (strong, nonatomic) WorkoutMO *workout;

- (IBAction)exerciseNameDidFocus:(id)sender;
- (IBAction)exerciseNameDidChange:(id)sender;
@end

@implementation AddExerciseViewController

@synthesize exerciseNameField, tableView, isEditingExerciseName, workout;

+ (AddExerciseViewController *)addExerciseToWorkout:(WorkoutMO *)workout {
  AddExerciseViewController *aeVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AddExerciseViewController"];
  aeVC.workout = workout;
  
  return aeVC;
}

- (void)viewDidLoad {
  self.title = @"Add Exercise";
  self.isEditingExerciseName = NO;
  
  // Draw border below name field
  CALayer *bottomBorder = [CALayer layer];
  bottomBorder.frame = CGRectMake(0, self.exerciseNameField.frame.size.height - 0.5, self.exerciseNameField.frame.size.width, 0.5f);
  bottomBorder.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.15f].CGColor;
  [self.exerciseNameField.layer addSublayer:bottomBorder];
}

- (IBAction)exerciseNameDidFocus:(id)sender {
  self.isEditingExerciseName = YES;
}

- (IBAction)exerciseNameDidChange:(id)sender {
  [self.tableView reloadData];
}

#pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  if (self.isEditingExerciseName)
    return 2;
  else
    return [self.workout.exercises count] + 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (self.isEditingExerciseName) {
    TitleDetailCell *cell = [[TitleDetailCell alloc] initWithCellID:@"CellID"];
    cell.title = @"Bicep curl";
    cell.details = @"Last time: yesterday";
    return cell;
  }
  else {
    if (indexPath.row < [self.workout.exercises count]) {
      return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    else {
      return [AddSetToExercise addSetCell];
    }
  }
}

@end
