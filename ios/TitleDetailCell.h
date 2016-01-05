//
//  TitleDetailCell.h
//  GymLog
//
//  Created by Feifan Zhou on 1/4/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleDetailCell : UITableViewCell
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *details;

- (id)initWithCellID:(NSString *)cellID;
@end
