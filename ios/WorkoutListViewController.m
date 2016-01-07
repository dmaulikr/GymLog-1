//
//  WorkoutListViewController.m
//  GymLog
//
//  Created by Feifan Zhou on 1/3/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "WorkoutListViewController.h"
#import "WorkoutMO.h"
#import "WorkoutsSummary.h"
#import "WorkoutDetailsViewController.h"
#import "TitleDetailCell.h"

@interface WorkoutListViewController()
- (IBAction)createNewWorkout:(id)sender;
@end

@implementation WorkoutListViewController
- (void)viewDidLoad {
  self.title = @"Workouts";
  [super viewDidLoad];
  
  UIBarButtonItem *addWorkoutButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createNewWorkout:)];
  self.navigationItem.rightBarButtonItem = addWorkoutButton;
}
- (void)viewWillAppear:(BOOL)animated {
  [self.tableView reloadData];
  [super viewWillAppear:animated];
}

- (IBAction)createNewWorkout:(id)sender {
  NSLog(@"Create new workout");
}

# pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [[WorkoutMO allWorkouts:nil] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellID = @"cellID";
  TitleDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
  if (!cell)
    cell = [[TitleDetailCell alloc] initWithCellID:cellID];
  
  WorkoutMO *workout = [WorkoutMO allWorkouts:nil][indexPath.row];
  NSDate *workoutStart = [NSDate dateWithTimeIntervalSinceReferenceDate:workout.workoutStart];
  NSDateFormatter *startFormatter = [[NSDateFormatter alloc] init];
  [startFormatter setDateFormat:@"MM/yyyy HH:mm"];
  cell.title = [NSString stringWithFormat:@"%@", [startFormatter stringFromDate:workoutStart]];
  
  int workoutDurationSeconds = (int)workout.workoutEnd - (int)workout.workoutStart;
  int workoutHours = workoutDurationSeconds / 3600;
  int workoutMinutes = (workoutDurationSeconds - workoutHours * 60) / 60;
  NSString *workoutDuration = [NSString stringWithFormat:@"%dh %dm", workoutHours, workoutMinutes];
  NSString *detailText;
  if (workout.location && [workout.location length] > 0)
    detailText = [NSString stringWithFormat:@"%@ • %@", workoutDuration, workout.location];
  else
    detailText = workoutDuration;
  cell.details = detailText;
  
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  
  return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 64;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  return [WorkoutsSummary summaryViewFromWorkouts:[WorkoutMO allWorkouts:nil]];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 76;
}

# pragma mark - Table View Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  [self.navigationController
    pushViewController:[WorkoutDetailsViewController detailsForWorkout:[WorkoutMO allWorkouts:nil][0]]
              animated:YES];
}
@end
