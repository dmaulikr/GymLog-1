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
#import "NotesCell.h"
#import "SetMO.h"

@interface AddExerciseViewController()
@property (strong, nonatomic) IBOutlet UITextField *exerciseNameField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) AddSetToExercise *addSetCell;
@property (nonatomic) BOOL isEditingExerciseName;
@property (strong, nonatomic) WorkoutMO *workout;

- (IBAction)exerciseNameDidFocus:(id)sender;
- (IBAction)exerciseNameDidChange:(id)sender;
- (IBAction)finishExercise:(id)sender;

- (void)finishEditingExerciseName;
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
  NSLog(@"Exercise: %@", self.exercise);
  
  // Draw border below name field
  CALayer *bottomBorder = [CALayer layer];
  bottomBorder.frame = CGRectMake(0, self.exerciseNameField.frame.size.height - 0.5, self.exerciseNameField.frame.size.width, 0.5f);
  bottomBorder.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.15f].CGColor;
  [self.exerciseNameField.layer addSublayer:bottomBorder];
  
  UIBarButtonItem *finishButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(finishExercise:)];
  self.navigationItem.rightBarButtonItem = finishButton;
}

- (IBAction)exerciseNameDidFocus:(id)sender {
  self.isEditingExerciseName = YES;
}

- (IBAction)exerciseNameDidChange:(id)sender {
  [self.tableView reloadData];
}

- (IBAction)exerciseNameDidFinishChanging:(id)sender {
  [self finishEditingExerciseName];
}

- (IBAction)finishExercise:(id)sender {
//  NSDictionary *setParams = @{
//                              @"repCount": [self.]
//                              }
}

- (void)finishEditingExerciseName {
  self.isEditingExerciseName = NO;
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
    return [self.exercise.sets count] + 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (self.isEditingExerciseName) {
    TitleDetailCell *cell = [[TitleDetailCell alloc] initWithCellID:@"CellID"];
    cell.title = @"Bicep curl";
    cell.details = @"Last time: yesterday";
    cell.backgroundColor = [UIColor colorWithRed:200 green:200 blue:200 alpha:1.0];
    return cell;
  }
  else {
    if (indexPath.row < [self.exercise.sets count]) {
      return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    else {
      self.addSetCell = [AddSetToExercise addSetCell];
      self.addSetCell.delegate = self;
      return self.addSetCell;
    }
  }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
  if (self.isEditingExerciseName)
    return nil;
  else
    return [NotesCell notesCell];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
  if (self.isEditingExerciseName)
    return 0;
  else
    return 80;
}

# pragma mark - Table View Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
}

# pragma mark - Add Set Delegate
- (void)addReps:(NSInteger)repCount atWeight:(float)weight {
  NSDictionary *setParams = @{
                              @"repCount": @(repCount),
                              @"weight": @(weight),
                              @"createdAt": [NSDate date],
                              @"exercise": self.exercise
                              };
  [SetMO create:setParams];
  [self.tableView reloadData];
}

@end
