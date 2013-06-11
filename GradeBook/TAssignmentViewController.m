//
//  TAssignmentViewController.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/19/13.
//
//

#import "TAssignmentViewController.h"

@interface TAssignmentViewController ()

@end

@implementation TAssignmentViewController
@synthesize dataArray, scoreTable, setting, scoreField, fname, lname, item,settingsCell,listOfRows;
NSIndexPath *deleteIndexPath;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOcrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOcrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    setting = [[AssignmentDataTable alloc] init];
	[setting initTableData];
	
	listOfRows = [[NSMutableArray alloc] init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popToViewController:self.parentViewController.parentViewController animated:YES];
}
- (IBAction)reportsButton:(id)sender {
}


# pragma mark Table Methods

/*- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [dataArray[section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [dataArray count];
}
/*- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0f;
}

/*-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 6, 300, 30);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    //label.shadowColor = [UIColor whiteColor];
    //label.shadowOffset = CGSizeMake(0.0, 1.0);
    label.font = [UIFont boldSystemFontOfSize:19];
    label.text = sectionTitle;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    float rd = 42.00/255.00;
    float gr = 205.00/255.00;
    float bl = 192.00/255.00;
    [headerView setBackgroundColor:[UIColor colorWithRed:rd green:gr blue:bl alpha:1.0]];
    [headerView addSubview:label];
    return headerView;
    
}

/*- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    
    
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = NSLocalizedString(@"Current", @"Current");
            break;
        case 1:
            sectionName = NSLocalizedString(@"Previous", @"Previous");
            break;
        case 2:
            sectionName = NSLocalizedString(@"Upcoming", @"Upcoming");
            break;
            // ...
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSMutableArray *array1 = [dataArray objectAtIndex:indexPath.section];
    NSString *cellValue = [array1 objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;*/
    
    static NSString *CellIdentifier = @"Cell";
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	// If there isn't an instance of a cell to reuse, create a new one
	if (cell == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"TempCell" owner:self options:nil];
		cell = settingsCell;
		settingsCell = nil;
        
		cell.textLabel.backgroundColor = [UIColor clearColor];
        
		lname.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
		scoreField.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
		//coolingField.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
		
       // [[scoreField layer] setCornerRadius:8.0f];
		//[[scoreField layer] setCornerRadius:8.0f];
		//[[scoreField layer] setMasksToBounds:YES];
		//[[coolingField layer] setCornerRadius:8.0f];
		//[[coolingField layer] setMasksToBounds:YES];
		
	}
	
    // Configure the cell...
	// Configure the cell's contents with regards to section and row
	// Fetch content for row label (day of week)
	NSDictionary *dictionary = [listOfRows objectAtIndex:indexPath.section];
	NSArray *array = [dictionary objectForKey:@"Content"];
	NSString *cellValue = [array objectAtIndex:indexPath.row];
	
	// Set text in cell label
	cell.textLabel.text = cellValue;
    
    lname.text = [NSString stringWithFormat:@"%@",[setting.lname objectAtIndex:indexPath.row]];
    
    
    scoreField.tag = (indexPath.row * 10) + 2;
    scoreField.text = [NSString stringWithFormat:@"%@",[setting.score objectAtIndex:indexPath.row]];
	
	// Set up time field display. Encode section and row into tag value.
	/*timeField.tag = (indexPath.section * 100) + (indexPath.row * 10) + TIME_FIELD;
	
	// Drop in time content from timeOfDays array
	timeField.text = [NSString stringWithFormat:@"%@", [self.dateFormatter stringFromDate:[settings.timeOfDays objectAtIndex:((indexPath.section * 4) + indexPath.row)]]];
	
	// Set up heating field display's tag. Drop in content from heatStr array.
	heatingField.tag = (indexPath.section * 100) + (indexPath.row * 10) + HEATING_FIELD;
	heatingField.text = [NSString stringWithFormat:@"%@", [settings.heatStr objectAtIndex:((indexPath.section * 4) + indexPath.row)]];
	
	// Set up tag for cooling field. Insert content from coolStr array.
	coolingField.tag = (indexPath.section * 100) + (indexPath.row * 10) + COOLING_FIELD;
	coolingField.text = [NSString stringWithFormat:@"%@", [settings.coolStr objectAtIndex:((indexPath.section * 4) + indexPath.row)]];*/
    
    return cell;
}

/*- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        deleteIndexPath = indexPath;
        NSString *rowValue = dataArray[deleteIndexPath.section][deleteIndexPath.row];
        
        NSString *message = [[NSString alloc] initWithFormat:@"Delete %@?", rowValue];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:message
                              //delegate:self
                                                        message:@""
                                                       delegate:self
                                              cancelButtonTitle:@"No"
                                              otherButtonTitles:@"Delete",nil];
        [alert show];
    }
}*/

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UIColor *altCellColor;
	
	if (indexPath.row == 0 || indexPath.row%2 == 0) {
		altCellColor = [UIColor colorWithRed:0.85 green:1.0 blue:1.0 alpha:1.0];
    } else {
		altCellColor = [UIColor colorWithRed:0.75 green:0.95 blue:1.0 alpha:1.0];
	}
	cell.backgroundColor = altCellColor;
    
}

/*
 To conform to Human Interface Guildelines, since selecting a row would have no effect (such as navigation), make sure that rows
 cannot be selected.
 */
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [setting.score replaceObjectAtindex:]
    
}

/*- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)//OK button pressed
    {NSLog(@"button 1");
        
        [dataArray[deleteIndexPath.section] removeObjectAtIndex:deleteIndexPath.row];
        [scoreTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:deleteIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        NSLog(@"delete Item");
    }
    if(buttonIndex == 0)
    {NSLog(@"button 0");
        
    }
    
}*/


/*- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
}*/


@end
