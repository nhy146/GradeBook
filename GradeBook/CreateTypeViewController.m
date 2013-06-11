//
//  CreateTypeViewController.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/8/13.
//
//

#import "CreateTypeViewController.h"
#import "CJSONDeserializer.h"
#import "Type.h"

@interface CreateTypeViewController ()

@end

@implementation CreateTypeViewController
@synthesize typeList, typelistTable, course, type, cid;
CGFloat				 animatedDistance;
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
    //First section data
    NSLog(@"cid=%@\n",cid);
    
    NSString *post =[NSString stringWithFormat:@"cid=%@",cid];
    
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
        rows = [dict objectForKey:@"records"];
    }
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
    [request setURL:[NSURL URLWithString:@"http://lsucptg434gb.summerhost.info/app_file/tview_type.php"]];
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
    typeList = [[NSMutableArray alloc] init];
    if([rows count] == 0){
        NSLog(@"nothing returned\n");
        //[self alertStatus:@"Incorrect username or password" :@"Login Failed!"];
    } else {
        NSLog(@"dictionary count = %i",[rows count]);
        for (int i = 0; i< [rows count];i++) {
            NSDictionary *typeDict = [rows objectAtIndex:i];
            type = [[Type alloc] initWithId:[typeDict objectForKey:@"cid"] type:[typeDict objectForKey:@"type"] weight:[typeDict objectForKey:@"weight"]];
            [typeList addObject:type];
        }
        NSLog (@"typeList: %i",[typeList count]);
        NSLog(@"type: %i",[typeList count]);
        //typeList = [[NSMutableArray alloc] init];
        /*for (int c = 0; c<[typeList count]; c++) {
            NSString *temp1 = [typeList objectAtIndex:c];
            NSLog(@"temp1: %@",temp1);
            NSMutableArray *col = [[NSMutableArray alloc] init];
            for (int r = 0; r<[typeList count]; r++) {
                Type *temp = [typeList objectAtIndex:r];
                if ([temp1 isEqualToString:temp.type]){
                    NSLog(@"hit");
                    [col addObject:temp];
                    
                }
            }*/
           // NSLog(@"col: %i",[col count]);
            //[typeList addObject: col];
           // NSLog(@"typeList1: %i",[typeList count]);
        //}
        NSLog(@"typeList: %i",[typeList count]);
    }
    
    //NSMutableArray *firstTypesArray = [[NSMutableArray alloc] initWithObjects:@"Hellos", @"Type 2", @"Type 3", nil];
    
    
    //Second section data
    //NSMutableArray *secondTypesArray = [[NSMutableArray alloc] initWithObjects:@"Type 4", @"Type 5", @"Type 6", @"Last Type", nil];
    
    
    //Third section data
    //NSMutableArray *thirdTypesArray = [[NSMutableArray alloc] initWithObjects:@"Type 4", @"Type 5", @"Type 6", @"Last Type", nil];
    
    //typeList = [[NSMutableArray alloc] initWithObjects: firstTypesArray, secondTypesArray, thirdTypesArray, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createtypeButton:(id)sender {
}
- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}




# pragma mark Table Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [typeList count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Type *cellValue = [typeList objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue.type;
    
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
        NSString *rowValue = typeList[deleteIndexPath.row];
        
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
        //[dataArray[deleteIndexPath.section] removeObjectAtIndex:deleteIndexPath.row];
        [typeList removeObjectAtIndex:deleteIndexPath.row];
       // [typelistTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:deleteIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        [typelistTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:deleteIndexPath] withRowAnimation:UITableViewRowAnimationFade];
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
