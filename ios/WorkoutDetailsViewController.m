//
//  WorkoutDetailsViewController.m
//  GymLog
//
//  Created by Feifan Zhou on 1/3/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "WorkoutDetailsViewController.h"
#import "WorkoutDetails.h"

@interface WorkoutDetailsViewController()
@property (strong, nonatomic) WorkoutMO *workout;
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
}

# pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.workout.exercises count];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  return [WorkoutDetails detailsFromWorkout:self.workout];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 72;
}

@end
