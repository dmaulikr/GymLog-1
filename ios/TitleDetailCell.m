//
//  TitleDetailCell.m
//  GymLog
//
//  Created by Feifan Zhou on 1/4/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "TitleDetailCell.h"

@implementation TitleDetailCell
@synthesize title, details;

- (id)initWithCellID:(NSString *)cellID {
  self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
  if (!self)
    return nil;
  
  self.bounds = CGRectInset(self.frame, 0, -4);
  self.textLabel.font = [UIFont boldSystemFontOfSize:17.0];
  self.detailTextLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.66];
  return self;
}

- (void)setTitle:(NSString *)newTitle {
  NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:newTitle];
  NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
  paragraphStyle.lineHeightMultiple = 1.3;
  [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, newTitle.length)];
  self.textLabel.attributedText = attributedString;
}

- (void)setDetails:(NSString *)newDetails {
  NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:newDetails];
  NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
  paragraphStyle.lineHeightMultiple = 1.3;
  [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, newDetails.length)];
  self.detailTextLabel.attributedText = attributedString;
}
@end
