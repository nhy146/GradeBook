//
//  CreateAccountViewController.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/6/13.
//
//

#import "CreateAccountViewController.h"
#import "CJSONDeserializer.h"
#import "THomeViewController.h"
#import "SHomeViewController.h"

@interface CreateAccountViewController ()
    

@end

@implementation CreateAccountViewController
@synthesize fnameTextField, lnameTextField, emailTextField, unameTextField, passwTextField, scrollView, activeField,listData, stsegcontrol;
CGFloat				 animatedDistance;

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
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"Student", @"Teacher", nil];
	self.listData = array;
    
    //stpicker.backgroundView = nil;
    fnameTextField.backgroundColor = [UIColor whiteColor];
    lnameTextField.backgroundColor = [UIColor whiteColor];
    emailTextField.backgroundColor = [UIColor whiteColor];
    unameTextField.backgroundColor = [UIColor whiteColor];
    passwTextField.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createacctButton:(id)sender {
    //add acct to db here
    if(stsegcontrol.selectedSegmentIndex == 1){//Teacher selected
        
        //create account
        NSURL *url=[NSURL URLWithString:@"http://lsucptg434gb.summerhost.info/app_file/tregister.php"];
        
        NSString *post =[NSString stringWithFormat:@"tfname=%@&tlname=%@&temail=%@&tuname=%@&tpassw=%@",[fnameTextField text],[lnameTextField text],[emailTextField text],[unameTextField text],[passwTextField text]];
        
        NSLog(@"%@",post);
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        NSHTTPURLResponse* urlResponse = nil;
        NSError *error = [[NSError alloc] init];
        [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        //NSLog(@"%@",error);
        
        //sign in after creating account
        NSString *post2 =[NSString stringWithFormat:@"tuname=%@&tpassw=%@",[unameTextField text],[passwTextField text]];
        NSData *postData2 = [post2 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength2 = [NSString stringWithFormat:@"%d", [postData2 length]];
        
        NSMutableURLRequest *request2 = [[NSMutableURLRequest alloc]init];
        [request2 setURL:[NSURL URLWithString:@"http://lsucptg434gb.summerhost.info/app_file/tsign_in.php"]];
        [request2 setHTTPMethod:@"POST"];
        [request2 setValue:postLength2 forHTTPHeaderField:@"Content-Length"];
        [request2 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request2 setHTTPBody:postData2];
        
        NSHTTPURLResponse* urlResponse2 = nil;
        NSError *error2 = [[NSError alloc] init];
        NSData *responseData2 = [NSURLConnection sendSynchronousRequest:request2 returningResponse:&urlResponse error:&error];
        NSDictionary * dict2 = [[CJSONDeserializer deserializer] deserializeAsDictionary:responseData2 error:&error];
        if (dict2)
        {
            rows = [dict2 objectForKey:@"records"]; //select jsonarray called "records"
        }
        
        //NSLog(@"Array: %@",rows); //Log json
        
        //segue to teacher home after signing in
        [self performSegueWithIdentifier:@"CreateAccttoTHome" sender:sender];
        
    } else if(stsegcontrol.selectedSegmentIndex == 0){//Student selected
        
        //create student account
        NSURL *url=[NSURL URLWithString:@"http://lsucptg434gb.summerhost.info/app_file/sregister.php"];
        
        NSString *post =[NSString stringWithFormat:@"sfname=%@&slname=%@&semail=%@&suname=%@&spassw=%@",[fnameTextField text],[lnameTextField text],[emailTextField text],[unameTextField text],[passwTextField text]];
        
        NSLog(@"%@",post);
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        NSHTTPURLResponse* urlResponse = nil;
        NSError *error = [[NSError alloc] init];
        [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        //NSLog(@"%@",error);
        
        //sign in after creating student account
        NSString *post2 =[NSString stringWithFormat:@"suname=%@&spassw=%@",[unameTextField text],[passwTextField text]];
        NSData *postData2 = [post2 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength2 = [NSString stringWithFormat:@"%d", [postData2 length]];
        
        NSMutableURLRequest *request2 = [[NSMutableURLRequest alloc]init];
        [request2 setURL:[NSURL URLWithString:@"http://lsucptg434gb.summerhost.info/app_file/ssign_in.php"]];
        [request2 setHTTPMethod:@"POST"];
        [request2 setValue:postLength2 forHTTPHeaderField:@"Content-Length"];
        [request2 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request2 setHTTPBody:postData2];
        
        NSHTTPURLResponse* urlResponse2 = nil;
        NSError *error2 = [[NSError alloc] init];
        NSData *responseData2 = [NSURLConnection sendSynchronousRequest:request2 returningResponse:&urlResponse error:&error];
        NSDictionary * dict2 = [[CJSONDeserializer deserializer] deserializeAsDictionary:responseData2 error:&error];
        if (dict2)
        {
            rows = [dict2 objectForKey:@"records"]; //select jsonarray called "records"
        }
        
        //NSLog(@"Array: %@",rows); //Log json
        
        //segue to student home screen after signing in
        [self performSegueWithIdentifier:@"CreateAccttoSHome" sender:sender];
        
    }
}

- (IBAction)cancelButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) backgroundTapHideKeyboard:(id)sender{
    
    [fnameTextField resignFirstResponder];
    [lnameTextField resignFirstResponder];
    [emailTextField resignFirstResponder];
    [unameTextField resignFirstResponder];
    [passwTextField resignFirstResponder];
    NSLog(@"background tap");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"hit return");
	if (textField == fnameTextField) {
		[textField resignFirstResponder];
		[lnameTextField becomeFirstResponder];
	}
    else if (textField == lnameTextField) {
		[textField resignFirstResponder];
        [emailTextField becomeFirstResponder];
	}
    else if (textField == emailTextField) {
		[textField resignFirstResponder];
        [unameTextField becomeFirstResponder];
	}

	else if (textField == unameTextField) {
		[textField resignFirstResponder];
        [passwTextField becomeFirstResponder];
	}
    else if (textField == passwTextField) {
		[textField resignFirstResponder];
	}

	return YES;
}


//To move keyboard so active text field is visible

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 140;

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
	CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.view];
	CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
	CGFloat numerator = midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
	CGFloat denominator = (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
	CGFloat heightFraction = numerator / denominator;
	if (heightFraction < 0.0)
	{
		heightFraction = 0.0;
	}
	else if (heightFraction > 1.0)
	{
		heightFraction = 1.0;
	}
	UIInterfaceOrientation orientation =
	[[UIApplication sharedApplication] statusBarOrientation];
	if (orientation == UIInterfaceOrientationPortrait ||
		orientation == UIInterfaceOrientationPortraitUpsideDown)
	{
		animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
	}
	else
	{
		animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
	}
	CGRect viewFrame = self.view.frame;
	viewFrame.origin.y -= animatedDistance;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
	[self.view setFrame:viewFrame];
	[UIView commitAnimations];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
	CGRect viewFrame = self.view.frame;
	viewFrame.origin.y += animatedDistance;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
	[self.view setFrame:viewFrame];
 	[UIView commitAnimations];
    
    //do checking on textfields here
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"CreateAccttoTHome"])
    {
        NSLog(@"WTF\n");
        // Get reference to the destination view controller
        THomeViewController *thomevc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        NSDictionary *dictTwo = [rows objectAtIndex: 0];
        NSLog(@"%i",[rows count]);
        [thomevc setTeacherId:[dictTwo objectForKey:@"tid"]];
    } else if ([[segue identifier] isEqualToString:@"CreateAccttoSHome"])
    {
        // Get reference to the destination view controller
        //SHomeViewController *shomevc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        //[shomevc setMyObjectHere:object];
    }
}



/*
#pragma mark Table Methods

// sets the number of rows in the table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [self.listData count];	// use the number of data item
}

// set up the content and property of each row
- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
	static NSString *cellIdentifier = @"SimpleTableIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
	
	// Set up the cell
	
	NSUInteger row = [indexPath row];				// the row
	cell.text = [listData objectAtIndex:row];		// text for this row
	cell.font = [UIFont boldSystemFontOfSize:14];	// font for this row
    
	
	return cell;
}
*/



@end
