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

@implementation WorkoutListViewController
- (void)viewDidLoad {
  self.title = @"Workouts";
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
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
  if (!cell)
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
  
  WorkoutMO *workout = [WorkoutMO allWorkouts:nil][indexPath.row];
  NSDate *workoutStart = [NSDate dateWithTimeIntervalSinceReferenceDate:workout.workoutStart];
  NSDateFormatter *startFormatter = [[NSDateFormatter alloc] init];
  [startFormatter setDateFormat:@"MM/yyyy HH:mm"];
  NSString *cellTitleText = [NSString stringWithFormat:@"%@", [startFormatter stringFromDate:workoutStart]];
  NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:cellTitleText];
  NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
  paragraphStyle.lineHeightMultiple = 1.3;
  [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, cellTitleText.length)];
  cell.textLabel.attributedText = attributedString;
  cell.textLabel.font = [UIFont boldSystemFontOfSize:17.0];
  
  int workoutDurationSeconds = (int)workout.workoutEnd - (int)workout.workoutStart;
  int workoutHours = workoutDurationSeconds / 3600;
  int workoutMinutes = (workoutDurationSeconds - workoutHours * 60) / 60;
  NSString *workoutDuration = [NSString stringWithFormat:@"%dh %dm", workoutHours, workoutMinutes];
  NSString *detailText;
  if (workout.location && [workout.location length] > 0)
    detailText = [NSString stringWithFormat:@"%@ • %@", workoutDuration, workout.location];
  else
    detailText = workoutDuration;
  attributedString = [[NSMutableAttributedString alloc] initWithString:detailText];
  [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, detailText.length)];
  cell.detailTextLabel.attributedText = attributedString;
  cell.detailTextLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.66];
  
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  
  return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 66;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  return [WorkoutsSummary summaryViewFromWorkouts:[WorkoutMO allWorkouts:nil]];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 78;
}
@end
