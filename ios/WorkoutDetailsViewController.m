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
#import "SetMO.h"

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
  NSDate *workoutStart = [NSDate dateWithTimeIntervalSince1970:self.workout.workoutStart];
  NSDateFormatter *startFormatter = [[NSDateFormatter alloc] init];
  [startFormatter setDateFormat:@"MM/dd/yyyy"];
  self.title = [startFormatter stringFromDate:workoutStart];
  
  self.tableView.contentInset = UIEdgeInsetsMake(0, 0, self.workoutActions.bounds.size.height, 0);
  
  self.workoutActions.delegate = self;
  
  UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
  UIVisualEffectView *bluredEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
  [bluredEffectView setFrame:self.workoutActions.bounds];
//  [self.view insertSubview:bluredEffectView belowSubview:self.workoutActions];
  [self.workoutActions insertSubview:bluredEffectView atIndex:0];
  
  UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editWorkout:)];
  self.navigationItem.rightBarButtonItem = editButton;
  
  [self getExercisesArray];
  
  [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
  [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
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

- (void)showDetailsForExercise:(ExerciseMO *)exercise newInstance:(BOOL)isNewInstance {
  AddExerciseViewController *aevc = [AddExerciseViewController addExerciseToWorkout:self.workout];
  aevc.showCancel = isNewInstance;
  aevc.exercise = exercise;
  aevc.delegate = self;
  [self.navigationController pushViewController:aevc animated:YES];
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
  NSMutableArray *setsStrings = [NSMutableArray arrayWithCapacity:[exercise.sets count]];
  for (SetMO *set in exercise.sortedSets)
    [setsStrings addObject:[NSString stringWithFormat:@"%d@%d", set.repCount, set.weight]];
  cell.details = [setsStrings componentsJoinedByString:@" | "];
  
  return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  return [WorkoutDetails detailsFromWorkout:self.workout];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 72;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  ExerciseMO *exercise = self.workout.exercises[indexPath.row];
  return 54 + ([exercise.sets count] / 7) * 28;
}

#pragma mark - Table View Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  ExerciseMO *exercise = self.exercises[indexPath.row];
  [self showDetailsForExercise:exercise newInstance:NO];
}

#pragma mark - Workout Actions Delegate
- (void)didSelectAddExercise {
  ExerciseMO *exercise = [ExerciseMO newInstance:@{@"createdAt": [NSDate date], @"workout": self.workout}];
  [self showDetailsForExercise:exercise newInstance:YES];
}

- (void)didSelectFinishExercise {
  [self.workout update:@{@"workoutEnd": [NSDate date]} save:YES];
  [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Add Exercise Delegate
- (void)didCancelAddingExercise:(ExerciseMO *)exercise {
  [self.workout removeExercisesObject:exercise];
  [self reload];
}

- (void)didFinishAddingExercise:(ExerciseMO *)exercise {
  [self reload];
}

@end
