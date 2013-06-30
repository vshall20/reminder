//
//  AddNewNotificationTableViewController.h
//  Reminder
//
//  Created by Vishal Dharmawat on 30/06/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewNotificationTableViewController : UITableViewController<UIAlertViewDelegate,UIPickerViewDelegate, UIPickerViewDataSource,UIActionSheetDelegate>{
    NSString *name;
    NSString *occassion;
    NSDate *selectedDate;
    double mobileNo;
    UIDatePicker *datePicker;
    UIActionSheet *pickerViewPopup;
    NSMutableArray *dataArray;
    UIPickerView *occassionPicker;
}

@end
