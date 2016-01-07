//
//  WorkoutDetailsViewController.m
//  GymLog
//
//  Created by Feifan Zhou on 1/3/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "WorkoutDetailsViewController.h"
#import "WorkoutDetails.h"
#import "WorkoutActions.h"
#import "AddExerciseViewController.h"
#import "ExerciseMO.h"
#import "TitleDetailCell.h"

@interface WorkoutDetailsViewController()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet WorkoutActions *workoutActions;
@property (strong, nonatomic) WorkoutMO *workout;
@property (strong, nonatomic) NSArray *exercises;

- (IBAction)editWorkout:(id)sender;

- (void)getExercisesArray;
- (void)reload;
@end

@implementation WorkoutDetailsViewController
+ (WorkoutDetailsViewController *)detailsForWorkout:(WorkoutMO *)workout {
  WorkoutDetailsViewController *detailsVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WorkoutDetailsViewController"];
  detailsVC.workout = workout;
  
  return detailsVC;
}
- (void)viewDidLoad {
  NSDate *workoutStart = [NSDate dateWithTimeIntervalSinceReferenceDate:self.workout.workoutStart];
  NSDateFormatter *startFormatter = [[NSDateFormatter alloc] init];
  [startFormatter setDateFormat:@"MM/yyyy"];
  self.title = [startFormatter stringFromDate:workoutStart];
  
  self.workoutActions.delegate = self;
  
  UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editWorkout:)];
  self.navigationItem.rightBarButtonItem = editButton;
  
  [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
}

- (void)reload {
  [self getExercisesArray];
  [self.tableView reloadData];
}

- (IBAction)editWorkout:(id)sender {
  NSLog(@"Edit workout");
}

- (void)getExercisesArray {
  self.exercises = [self.workout.exercises sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:YES]]];
}

# pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.workout.exercises count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellID = @"cellID";
  TitleDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
  if (!cell)
    cell = [[TitleDetailCell alloc] initWithCellID:cellID];
  
  ExerciseMO *exercise = self.exercises[indexPath.row];
  cell.title = exercise.name;
  cell.details = [NSString stringWithFormat:@"%lu sets", [exercise.sets count]];
  
  return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  return [WorkoutDetails detailsFromWorkout:self.workout];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 72;
}

#pragma mark - Workout Actions Delegate
- (void)didSelectAddExercise {
  ExerciseMO *exercise = [ExerciseMO newInstance:@{@"createdAt": [NSDate date], @"workout": self.workout}];
  AddExerciseViewController *aevc = [AddExerciseViewController addExerciseToWorkout:self.workout];
  aevc.exercise = exercise;
  aevc.delegate = self;
  [self.navigationController pushViewController:aevc animated:YES];
}

#pragma mark - Add Exercise Delegate
- (void)didCancelAddingExercise:(ExerciseMO *)exercise {
  [self.workout removeExercisesObject:exercise];
  [self reload];
}

- (void)didFinishAddingExercise:(ExerciseMO *)exercise {
  NSLog(@"Did finish adding exercise: %@", exercise);
  [self reload];
}

@end
