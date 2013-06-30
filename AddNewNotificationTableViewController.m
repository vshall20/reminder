//
//  AddNewNotificationTableViewController.m
//  Reminder
//
//  Created by Vishal Dharmawat on 30/06/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import "AddNewNotificationTableViewController.h"

@interface AddNewNotificationTableViewController ()

@end

@implementation AddNewNotificationTableViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    occassionPicker = [[UIPickerView alloc]init];
    dataArray = [[NSMutableArray alloc] init];
    
        // Add some data for demo purposes.
    [dataArray addObject:@"Birthday"];
    [dataArray addObject:@"Aniversary"];

    pickerViewPopup = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    
    occassionPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, 0, 0)];
    [occassionPicker setDataSource: self];
    [occassionPicker setDelegate: self];
    occassionPicker.showsSelectionIndicator = YES;
    
    datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 44, 0, 0)];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker.hidden = NO;
    datePicker.date = [NSDate date];
    
    UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    pickerToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(categoryDoneButtonPressed)];
    [barItems addObject:doneBtn];
    
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(categoryCancelButtonPressed)];
    [barItems addObject:cancelBtn];
    
    [pickerToolbar setItems:barItems animated:YES];
    
    [pickerViewPopup addSubview:pickerToolbar];
    [pickerViewPopup addSubview:occassionPicker];
    [pickerViewPopup addSubview:datePicker];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
        // Handle the selection
    
    NSLog(@"%@",[dataArray objectAtIndex:row]);
    occassion = [dataArray objectAtIndex:row];
    [self reload];
//    selectedCategory = [NSString stringWithFormat:@"%@",[dataArray objectAtIndex:row]];
}
    // tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [dataArray count];
}

    // tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

    // tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [dataArray objectAtIndex: row];
    
}

    // tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    int sectionWidth = 300;
    
    return sectionWidth;
}

-(void)categoryDoneButtonPressed{
//    categoryLable.text = selectedCategory;
    [pickerViewPopup dismissWithClickedButtonIndex:1 animated:YES];
}

-(void)categoryCancelButtonPressed{
    [pickerViewPopup dismissWithClickedButtonIndex:1 animated:YES];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier1 = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1 forIndexPath:indexPath];
    // Configure the cell...
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Name";
            if (name != nil) {
                cell.detailTextLabel.text = name;
            }
            else{
                cell.detailTextLabel.text = @"Enter Name";
            }
            break;
        case 1:
            cell.textLabel.text = @"Mobile No.";
            if (mobileNo) {
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",mobileNo];
            }
            else {
                cell.detailTextLabel.text = @"Enter Mobile No.";
            }
            break;
        case 2:
            cell.textLabel.text = @"Occassion";
            if (occassion != nil) {
                cell.detailTextLabel.text = occassion;
            }
            else{
                cell.detailTextLabel.text = @"Select Occassion";
            }
            break;
        case 3:
            cell.textLabel.text = @"Date";
            if (selectedDate != nil) {
                cell.detailTextLabel.text = [NSDateFormatter localizedStringFromDate:selectedDate dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle];
            }
            else {
                cell.detailTextLabel.text = @"Select Date";
            }
            break;
        default:
            break;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    switch (indexPath.row) {
        case 0:
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Enter Name" message:nil delegate:self cancelButtonTitle:@"Done" otherButtonTitles: nil];
            alert.alertViewStyle = UIAlertViewStylePlainTextInput;
            [alert show];
            break;
        }
        case 1:
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Enter Mobile No." message:nil delegate:self cancelButtonTitle:@"Done" otherButtonTitles: nil];
            alert.alertViewStyle = UIAlertViewStylePlainTextInput;
            [alert show];
            break;
        }
        case 2:
        {
            [pickerViewPopup showInView:self.view];
            [pickerViewPopup setBounds:CGRectMake(0,0,320, 460)];
            occassion = [dataArray objectAtIndex:0];
            occassionPicker.hidden = NO;
            datePicker.hidden = YES;
            [self reload];
            break;
        }
        case 3:
        {
            [pickerViewPopup showInView:self.view];
            [pickerViewPopup setBounds:CGRectMake(0,0,320, 460)];
            occassionPicker.hidden = YES;
            datePicker.hidden = NO;
            selectedDate = datePicker.date;
            [self reload];
            [datePicker addTarget:self
                           action:@selector(reload)
                 forControlEvents:UIControlEventValueChanged];
            break;
        }
        default:
            break;
    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView.title isEqualToString:@"Enter Name"]) {
        name = [alertView textFieldAtIndex:0].text;
    }
    else if([alertView.title isEqualToString:@"Enter Mobile No."]) {
        mobileNo = [[alertView textFieldAtIndex:0].text doubleValue];
    }
    [self reload];
    NSLog(@"%@", [alertView textFieldAtIndex:0].text);
}


-(void)reload
{
    selectedDate = datePicker.date;
    [self.tableView reloadData];
}
@end
