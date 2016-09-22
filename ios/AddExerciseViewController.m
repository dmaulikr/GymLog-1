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
#import "ExerciseSetCell.h"
#import "ProgressChartView.h"

@interface AddExerciseViewController()
@property (strong, nonatomic) IBOutlet UITextField *exerciseNameField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) AddSetToExercise *addSetCell;
@property (nonatomic) BOOL isEditingExerciseName;
@property (strong, nonatomic) WorkoutMO *workout;
@property (strong, nonatomic) NSArray *sets;
@property (strong, nonatomic) NSArray *exercises;
@property (strong, nonatomic) NotesCell *notesCell;

- (IBAction)cancelAddExercise:(id)sender;
- (IBAction)exerciseNameDidFocus:(id)sender;
- (IBAction)exerciseNameDidChange:(id)sender;
- (IBAction)finishExercise:(id)sender;

- (void)finishEditingExerciseName;
- (void)getSetsArray;
- (NSArray *)progressDataForCurrentExercise;
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
  
  self.exerciseNameField.text = self.exercise.name;
  [self getSetsArray];
  
  // Draw border below name field
  CALayer *bottomBorder = [CALayer layer];
  bottomBorder.frame = CGRectMake(0, self.exerciseNameField.frame.size.height - 0.5, self.exerciseNameField.frame.size.width, 0.5f);
  bottomBorder.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.15f].CGColor;
  [self.exerciseNameField.layer addSublayer:bottomBorder];
  
  if (self.showCancel) {
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAddExercise:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
  }
  UIBarButtonItem *finishButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(finishExercise:)];
  self.navigationItem.rightBarButtonItem = finishButton;
  
  NSError *error = nil;
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"exercises"
                                                       ofType:@"json"];
  NSData *dataFromFile = [NSData dataWithContentsOfFile:filePath];
  NSDictionary *exercisesJSON = [NSJSONSerialization JSONObjectWithData:dataFromFile
                                                       options:kNilOptions
                                                         error:&error];
  self.exercises = exercisesJSON[@"exercises"];
}

- (void)viewDidAppear:(BOOL)animated {
  [self getSetsArray];
  [super viewDidAppear:animated];
}

- (IBAction)cancelAddExercise:(id)sender {
  if (self.delegate && [self.delegate respondsToSelector:@selector(didCancelAddingExercise:)])
    [self.delegate didCancelAddingExercise:self.exercise];
  [self.navigationController popViewControllerAnimated:YES];
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
  [self.exercise update:@{@"name": self.exerciseNameField.text, @"notes": self.notesCell.notes} save:YES];
  if (self.delegate && [self.delegate respondsToSelector:@selector(didFinishAddingExercise:)])
    [self.delegate didFinishAddingExercise:self.exercise];
  [self.navigationController popViewControllerAnimated:YES];
}

- (void)finishEditingExerciseName {
  self.isEditingExerciseName = NO;
  [self.tableView reloadData];
}

- (void)getSetsArray {
  self.sets = [self.exercise.sets sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:YES]]];
}

- (NSArray *)progressDataForCurrentExercise {
  NSArray *previousInstances = [ExerciseMO findAllByName:self.exerciseNameField.text error:nil];
  NSMutableArray *progressData = [NSMutableArray arrayWithCapacity:[previousInstances count]];
  for (ExerciseMO *exercise in previousInstances) {
    int maxWeight = 0;
    for (SetMO *set in exercise.sets)
      if (set.weight > maxWeight)
        maxWeight = set.weight;
    [progressData addObject:@{@"createdAt": @(exercise.createdAt), @"value": @(maxWeight)}];
  }
  return progressData;
}

- (NSArray *)filteredExercises {
  NSMutableArray *filterResult = [NSMutableArray array];
  for (NSString *name in [ExerciseMO exerciseNames]) {
    if ([[name lowercaseString] rangeOfString:[self.exerciseNameField.text lowercaseString]].location == 0) {
      NSArray *previousInstances = [ExerciseMO findAllByName:name error:nil];  // Sorted latest first
      ExerciseMO *lastInstance = previousInstances[0];
      NSInteger daysAgo = -1;
      if (lastInstance) {
        // http://stackoverflow.com/a/4576575/472768
        NSDate *today = [NSDate date];
        NSDate *workoutDate = [NSDate dateWithTimeIntervalSince1970:lastInstance.createdAt];
        NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay
                                                            fromDate:workoutDate
                                                              toDate:today
                                                             options:NSCalendarWrapComponents];
        daysAgo = [components day];
      }
      [filterResult addObject:@{@"name": name, @"daysAgo": @(daysAgo)}];
    }
  }
  return filterResult;
}

#pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  if (self.isEditingExerciseName)
    return [[self filteredExercises] count];
  else
    return [self.exercise.sets count] + 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (self.isEditingExerciseName) {
    NSArray *filteredExercises = [self filteredExercises];
    TitleDetailCell *cell = [[TitleDetailCell alloc] initWithCellID:@"CellID"];
    NSDictionary *suggestedExercise = filteredExercises[indexPath.row];
    cell.title = suggestedExercise[@"name"];
    int daysAgo = [suggestedExercise[@"daysAgo"] intValue];
    NSString *lastTime;
    if (daysAgo < 0)
      lastTime = @"Last time: Unknown";
    else if (daysAgo == 0)
      lastTime = @"Last time: Today";
    else
      lastTime = [NSString stringWithFormat:@"Last time: %d days ago", daysAgo];
    cell.details = lastTime;
    cell.backgroundColor = [UIColor colorWithRed:200 green:200 blue:200 alpha:1.0];
    return cell;
  }
  else {
    if (indexPath.row < [self.exercise.sets count]) {
      return [ExerciseSetCell cellForSet:self.sets[indexPath.row]];
    }
    else {
      self.addSetCell = [AddSetToExercise addSetCell];
      self.addSetCell.delegate = self;
      return self.addSetCell;
    }
  }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  if (self.isEditingExerciseName)
    return nil;
  else
    return [ProgressChartView progressChartForData:[self progressDataForCurrentExercise]];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  if (self.isEditingExerciseName)
    return 0;
  else
    return 120;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
  if (self.isEditingExerciseName)
    return nil;
  else
    return self.notesCell = [NotesCell notesCellWithNotes:self.exercise.notes];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
  if (self.isEditingExerciseName)
    return 0;
  else
    return 80;
}

# pragma mark - Table View Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if (self.isEditingExerciseName) {
    NSString *selectedName = [self filteredExercises][indexPath.row][@"name"];
    self.exerciseNameField.text = selectedName;
    if (!self.exercise.name)
      self.exercise.name = selectedName;
    [self finishEditingExerciseName];
  }
  else {
    return;
  }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  if (self.isEditingExerciseName)
    return NO;
  return indexPath.row < [self.exercise.sets count];
}

- (void)tableView:(UITableView *)table commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    [(SetMO *)self.sets[indexPath.row] destroy];
    [table deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
  } else {
    NSLog(@"Unhandled editing style! %ld", (long)editingStyle);
  }
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
  [self getSetsArray];
  [self.tableView reloadData];
  double delayInSeconds = 0.25;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    [self.addSetCell focus];
  });
}

@end
