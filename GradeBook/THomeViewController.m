//
//  THomeViewController.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/10/13.
//
//

#import "THomeViewController.h"
#import "CJSONDeserializer.h"
#import "TCourseViewController.h"
#import "Course.h"
#import "Teacher.h"
#import "Student.h"
#import "EditViewController.h"

@interface THomeViewController ()

@end

@implementation THomeViewController
@synthesize dataArray, courseTable,rows,teacher,course;
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
    //Initialize the dataArray
    //dataArray = [[NSMutableArray alloc] init];
    NSLog(@"Teacher id in Home = %@",teacher.tid);
    
    NSString *post =[NSString stringWithFormat:@"tid=%@",teacher.tid];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:@"http://lsucptg434gb.summerhost.info/app_file/tview_course.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    
    
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSDictionary * dict = [[CJSONDeserializer deserializer] deserializeAsDictionary:responseData error:&error];
    if (dict)
    {
        rows = [dict objectForKey:@"records"]; //select jsonarray called "records"
    }
    
    NSLog(@"Course Array: %@",rows); //Log json
    
    if([rows count] == 0){
        NSLog(@"nothing returned\n");
        //[self alertStatus:@"Incorrect username or password" :@"Login Failed!"];
    } else {
        NSLog(@"dictionary count = %i",[rows count]);
        //NSDictionary *dictTwo;// = [rows objectAtIndex: 0];
    //Create section arrays
        //Current courses
        NSMutableArray *firstItemsArray = [[NSMutableArray alloc] init];
        
        
        //Previous courses
        NSMutableArray *secondItemsArray = [[NSMutableArray alloc] init];
        
        
        //Upcoming courses
        NSMutableArray *thirdItemsArray = [[NSMutableArray alloc] init];

        int count;
        for (count = [rows count]; count > 0; count--) {
            NSDictionary *dictTwo = [rows objectAtIndex:count-1];
            course = [[Course alloc] initWithId:[dictTwo objectForKey:@"cid"] teacherId:[dictTwo objectForKey:@"tid"]name:[dictTwo objectForKey:@"cname"] description:[dictTwo objectForKey:@"desc"] enrollmentKey:[dictTwo objectForKey:@"ekey"] startDate:[dictTwo objectForKey:@"start"] endDate:[dictTwo objectForKey:@"end"]school:[dictTwo objectForKey:@"school"]];
        
            // Create a String from your datasource
    
            NSString *startString = course.start;
            NSString *endString = course.end;
            NSLog(@"start = %@, end = %@",startString, endString);
    
            //Create a formatter
    
            NSDateFormatter *mysqlformat = [[NSDateFormatter alloc] init];
            [mysqlformat setDateFormat:@"yyyy-MM-dd"];
    
            //[formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
            //Create your NSDate
    
            NSDate *startDate = [mysqlformat dateFromString:startString];
            NSDate *endDate = [mysqlformat dateFromString:endString];
    
            NSLog(@"start %@, end %@", startDate,endDate);

    
            NSDate *today = [NSDate date];
    
            NSLog(@"now: %@", today); // now: 2011-02-28 09:57:49 +0000
        
            if ([startDate compare:today] == NSOrderedDescending) {
                NSLog(@"Start date is later than today = upcoming");
                    [thirdItemsArray addObject:course];
                            
            } else if ([startDate compare:today] == NSOrderedAscending) {
                NSLog(@"Start date is earlier than today = 1 or 2");
                if ([endDate compare:today] == NSOrderedAscending){
                    NSLog(@"endDate is earlier than today = Course is previous");
                    [secondItemsArray addObject:course];
                } else if ([endDate compare:today] == NSOrderedAscending){
                    NSLog(@"endDate is before today = Course is current");
                    [firstItemsArray addObject:course];
                } else {
                    NSLog(@"endDate is today = Course is current??");
                    [firstItemsArray addObject:course];
                }
            
            } else {
                NSLog(@"dates are the same = Course is current");
                [firstItemsArray addObject:course];
            
            }
        
        }//end for
    

   
    dataArray = [[NSMutableArray alloc] initWithObjects: firstItemsArray, secondItemsArray, thirdItemsArray, nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signoutButton:(id)sender {
    //how are we going to sign out?
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)newcourseButton:(id)sender {
}
- (IBAction)editButton:(id)sender {
    [self performSegueWithIdentifier:@"THomeToEdit" sender:sender];
}

- (IBAction)helpButton:(id)sender {
}


# pragma mark Table Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    return [dataArray[section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
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
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSMutableArray *array1 = [dataArray objectAtIndex:indexPath.section];
    Course *cellValue = [array1 objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue.cname;
    
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
        [courseTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:deleteIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        NSLog(@"delete Item");
    }
    if(buttonIndex == 0)
    {NSLog(@"button 0");
   
    }

}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	
	[self performSegueWithIdentifier:@"THomeToTCourse" sender:indexPath];
	
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([[segue identifier] isEqualToString:@"THomeToTCourse"])
    {
        TCourseViewController *tcoursevc = [segue destinationViewController];
        NSIndexPath * indexPath = (NSIndexPath*)sender;
        NSLog(@"%@",indexPath);
        NSMutableArray *array1 = [dataArray objectAtIndex:indexPath.section];
        Course *cellValue = [array1 objectAtIndex:indexPath.row];
        [tcoursevc setCourse: cellValue];
        //need php code to get course id using teacher id and course name
        
    } else if ([[segue identifier] isEqualToString:@"THomeToEdit"]) {
        EditViewController *teditvc = [segue destinationViewController];
        [teditvc setTeacher: teacher];
        [teditvc setStudent: [[Student alloc] initNull]];
    }
    
}


- (IBAction)returnToTHomeActionForSegue:(UIStoryboardSegue *)returnSegue {
    
    // do useful actions here
    
}


@end
