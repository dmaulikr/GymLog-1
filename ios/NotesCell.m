//
//  NotesCell.m
//  GymLog
//
//  Created by Feifan Zhou on 1/6/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "NotesCell.h"
#import "UITextView+Placeholder.h"

@interface NotesCell()
@property (strong, nonatomic) IBOutlet UITextView *notesField;
@end

@implementation NotesCell

+ (NotesCell *)notesCell {
  NotesCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"NotesCell" owner:nil options:nil] lastObject];
  if (!cell)
    return nil;
  cell.notesField.placeholder = @"Notes";
  
  return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
