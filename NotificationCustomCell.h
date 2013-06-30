//
//  NotificationCustomCell.h
//  Reminder
//
//  Created by Vishal Dharmawat on 30/06/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationCustomCell : UITableViewCell


@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *occassionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
