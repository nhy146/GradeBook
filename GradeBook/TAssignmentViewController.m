//
//  TAssignmentViewController.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/19/13.
//
//

#import "TAssignmentViewController.h"
#import "TableData.h"
#import <QuartzCore/QuartzCore.h>

@interface TAssignmentViewController ()

@end

@implementation TAssignmentViewController
@synthesize dataArray, scoreTable,settingsCell,listOfRows,fname,lname,scoreField;
NSIndexPath *deleteIndexPath;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*- (void) setUpTable {
    NSMutableArray *fnameArrray = [[NSMutableArray alloc] initWithObjects:@"John", @"David", @"Sam", nil];
    
    NSMutableArray *lnameArrray = [[NSMutableArray alloc] initWithObjects:@"Monkey", @"Jade", @"Vimes", nil];
    
    NSMutableArray *scoreArrray = [[NSMutableArray alloc] initWithObjects:@"45.0", @"46.0", @"47.0", nil];

    for (int i=0;i<[lnameArrray count];i++) {
        TableData *temp = [[TableData alloc] initTableDataWithFirstName:[fnameArrray objectAtIndex:i] LastName:[lnameArrray objectAtIndex:i] Score:[scoreArrray objectAtIndex:i]];
        [listOfRows addObject:temp];
        
    }
    

}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    NSMutableArray *fnameArrray = [[NSMutableArray alloc] initWithObjects:@"John", @"David", @"Sam", nil];
    
    NSMutableArray *lnameArrray = [[NSMutableArray alloc] initWithObjects:@"Monkey", @"Jade", @"Vimes", nil];
    
    NSMutableArray *scoreArrray = [[NSMutableArray alloc] initWithObjects:@"45.0", @"46.0", @"47.0", nil];
    
    dataArray = [[NSMutableArray alloc] init];
    NSLog(@" lname count: %i",[lnameArrray count]);
    for (int i=0;i<[lnameArrray count];i++) {
        
        NSLog(@"fname: %@",[fnameArrray objectAtIndex:i]);
        NSLog(@"lname: %@",[lnameArrray objectAtIndex:i]);
        NSLog(@"score: %@",[scoreArrray objectAtIndex:i]);
        
        
        TableData *temp = [[TableData alloc] initTableDataWithFirstName:[fnameArrray objectAtIndex:i] LastName:[lnameArrray objectAtIndex:i] Score:[scoreArrray objectAtIndex:i]];
        NSLog(@"%@",temp);
        /*TableData *temp2 = [[TableData alloc] initTableDataWithFirstName:[fnameArrray objectAtIndex:0] LastName:[lnameArrray objectAtIndex:0] Score:[scoreArrray objectAtIndex:0]];*/
        [dataArray addObject:temp];
    }
    NSLog(@"%@",dataArray);
    NSLog(@"listOfRows count1: %i",[dataArray count]);

    

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

- (NSInteger)tabelView: (UITableView *)tableView numberofRoes:(NSInteger) section {
    return [dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"listOfRows count2: %i",[listOfRows count]);
    return [dataArray count];//[dataArray[section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //return [dataArray count];
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
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
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSMutableArray *array1 = [dataArray objectAtIndex:indexPath.section];
    NSString *cellValue = [array1 objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;*/
    
    static NSString *CellIdentifier = @"Cell";
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	// If there isn't an instance of a cell to reuse, create a new one
	if (cell == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"TempCell" owner:self options:nil];
		cell = settingsCell;
		settingsCell = nil;
        
		cell.textLabel.backgroundColor = [UIColor clearColor];
        
		fname.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
		lname.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
		scoreField.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
		
		/*[[heatingField layer] setCornerRadius:8.0f];
		[[heatingField layer] setMasksToBounds:YES];
		[[coolingField layer] setCornerRadius:8.0f];
		[[coolingField layer] setMasksToBounds:YES];*/
		
	}
	
    // Configure the cell...
	// Configure the cell's contents with regards to section and row
	// Fetch content for row label (day of week)
	//NSDictionary *dictionary = [listOfRows objectAtIndex:indexPath.section];
	//NSArray *array = [dictionary objectForKey:@"Content"];
    NSArray *array = [[NSArray alloc] initWithArray:dataArray];
	TableData *cellValue = [array objectAtIndex:indexPath.row];
	
	// Set text in cell label
	cell.textLabel.text = cellValue.fname;
	
	/*// Set up time field display. Encode section and row into tag value.
	fname.tag = (indexPath.section * 100) + (indexPath.row * 10) + TIME_FIELD;
	
	// Drop in time content from timeOfDays array
	timeField.text = [NSString stringWithFormat:@"%@", [self.dateFormatter stringFromDate:[settings.timeOfDays objectAtIndex:((indexPath.section * 4) + indexPath.row)]]];
	
	// Set up heating field display's tag. Drop in content from heatStr array.
	heatingField.tag = (indexPath.section * 100) + (indexPath.row * 10) + HEATING_FIELD;
	heatingField.text = [NSString stringWithFormat:@"%@", [settings.heatStr objectAtIndex:((indexPath.section * 4) + indexPath.row)]];*/
	
	// Set up tag for cooling field. Insert content from coolStr array.
	//scoreField.tag = (indexPath.section * 100) + (indexPath.row * 10) + 1;
    lname.text = [NSString stringWithFormat:@"%@", cellValue.lname];
	scoreField.text = [NSString stringWithFormat:@"%@", cellValue.score];
    
    return cell;

    
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
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
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
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
    
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	
	
	
}


@end
