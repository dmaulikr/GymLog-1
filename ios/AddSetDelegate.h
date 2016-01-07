//
//  AddSetDelegate.h
//  GymLog
//
//  Created by Feifan Zhou on 1/6/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#ifndef AddSetDelegate_h
#define AddSetDelegate_h

@protocol AddSetDelegate <NSObject>

@optional
- (void)addReps:(NSInteger)repCount atWeight:(float)weight;
@end


#endif /* AddSetDelegate_h */
