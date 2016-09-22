/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"
#import "WorkoutListViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.9843137255 green:0.3215686275 blue:0.2 alpha:1.0]];
  [[UINavigationBar appearance] setTranslucent:NO];
  [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                         NSForegroundColorAttributeName: [UIColor whiteColor]
                                                         }];
  [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

//  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//  self.window.rootViewController = [WorkoutListViewController new];
//  [self.window makeKeyAndVisible];
  return YES;
}

@end
