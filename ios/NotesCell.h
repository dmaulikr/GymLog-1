//
//  NotesCell.h
//  GymLog
//
//  Created by Feifan Zhou on 1/6/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesCell : UITableViewCell
@property (readonly) NSString *notes;

+ (NotesCell *)notesCellWithNotes:(NSString *)notes;
@end
