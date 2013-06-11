//
//  TCourseViewController.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/9/13.
//
//

#import "TCourseViewController.h"
#import "THomeViewController.h"
#import "CJSONDeserializer.h"
#import "CreateAssignmentViewController.h"
#import "TAssignmentViewController.h"
#import "Course.h"
#import "Item.h"



@interface TCourseViewController ()

@end

@implementation TCourseViewController
@synthesize dataArray, assignmentTable, course, item, typeList;
NSIndexPath *deleteIndexPath;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"Course id in Home = %@",course.cid);
    
    NSString *post =[NSString stringWithFormat:@"cid=%@",course.cid];
    
    NSLog(@"%@",post);
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:@"http://lsucptg434gb.summerhost.info/app_file/tview_type.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSDictionary * dict = [[CJSONDeserializer deserializer] deserializeAsDictionary:responseData error:&error];
    NSArray *rows = [[NSArray alloc] init];
    if (dict) {
        NSLog(@"Hello");
        rows = [dict objectForKey:@"records"];
    }
    NSLog(@"Row: %@",rows);
    typeList = [[NSMutableArray alloc] init];
    if([rows count] == 0) {
        NSLog(@"No type returned\n");
    } else {
        NSLog(@"There are %i type(s)", [rows count]);
            for (int k = 0; k < [rows count]; k++) {
            NSDictionary *typeDict = [rows objectAtIndex:k];
            [typeList addObject:[typeDict objectForKey:@"type"]];
        }
    }
    NSLog(@"%i",[typeList count]);
    
    request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:@"http://lsucptg434gb.summerhost.info/app_file/tview_item.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    
    
    urlResponse = nil;
    error = [[NSError alloc] init];
    responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    dict = [[CJSONDeserializer deserializer] deserializeAsDictionary:responseData error:&error];
    rows = [[NSArray alloc] init];
    if (dict)
    {
        rows = [dict objectForKey:@"records"]; //select jsonarray called "records"
    }
    
    NSLog(@"Course Array: %@",rows); //Log json
    NSMutableArray *itemList = [[NSMutableArray alloc] init];
    if([rows count] == 0){
        NSLog(@"nothing returned\n");
        //[self alertStatus:@"Incorrect username or password" :@"Login Failed!"];
    } else {
        NSLog(@"dictionary count = %i",[rows count]);
        for (int i = 0; i< [rows count];i++) {
            NSDictionary *itemDict = [rows objectAtIndex:i];
            item = [[Item alloc] initWithId:[itemDict objectForKey:@"iid"] name:[itemDict objectForKey:@"iname"] type:[itemDict objectForKey:@"type"] pointsPossible:[itemDict objectForKey:@"points"] courseId:[itemDict objectForKey:@"cid"] endDate:[itemDict objectForKey:@"end"] hidden:[itemDict objectForKey:@"hidden"]];
            [itemList addObject:item];
        }
        NSLog (@"itemList: %i",[itemList count]);
        NSLog(@"type: %i",[typeList count]);
        dataArray = [[NSMutableArray alloc] init];
        for (int c = 0; c<[typeList count]; c++) {
            NSString *temp1 = [typeList objectAtIndex:c];
            NSLog(@"temp1: %@",temp1);
            NSMutableArray *col = [[NSMutableArray alloc] init];
            for (int r = 0; r<[itemList count]; r++) {
                Item *temp = [itemList objectAtIndex:r];
                if ([temp1 isEqualToString:temp.type]){
                    NSLog(@"hit");
                    [col addObject:temp];
                    
                }
            }
            NSLog(@"col: %i",[col count]);
            [dataArray addObject: col];
            NSLog(@"dataArray1: %i",[dataArray count]);
        }
        NSLog(@"dataArray: %i",[dataArray count]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)homeButton:(id)sender { ////////////////////////////////
    
    //[self.navigationController popViewControllerAnimated:YES];
    //[self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)editcourseinfoButton:(id)sender {
}

- (IBAction)newassignmentButton:(id)sender {
    [self performSegueWithIdentifier:@"TCourseToCreateAssignment" sender:sender];
}

- (IBAction)newtypeButton:(id)sender {
}

- (IBAction)reportsButton:(id)sender {
}

- (IBAction)contactButton:(id)sender {
}


# pragma mark Table Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [dataArray[section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"Section: %i",[dataArray count]);
    return [dataArray count];
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
    sectionName = [typeList objectAtIndex:section];
    /*switch (section)
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
    }*/
    return sectionName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSMutableArray *array1 = [dataArray objectAtIndex:indexPath.section];
    Item *cellValue = [array1 objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue.iname;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
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
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)//OK button pressed
    {NSLog(@"button 1");
        
        [dataArray[deleteIndexPath.section] removeObjectAtIndex:deleteIndexPath.row];
        [assignmentTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:deleteIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        NSLog(@"delete Item");
    }
    if(buttonIndex == 0)
    {NSLog(@"button 0");
        
    }
    
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	
	
	
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"TCourseToCreateAssignment"]) {
        CreateAssignmentViewController *cAssigvc = [segue destinationViewController];
        NSString *cid = course.cid;
        [cAssigvc setCid: cid];
        [cAssigvc setTypeList: typeList];
        
    }
}


- (IBAction)returnToTCourseActionForSegue:(UIStoryboardSegue *)returnSegue {
    
    // do useful actions here.
    
}

@end
