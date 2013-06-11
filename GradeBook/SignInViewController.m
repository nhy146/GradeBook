//
//  SignInViewController.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/8/13.
//
//

#import "SignInViewController.h"
#import "THomeViewController.h"
#import "SHomeViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CJSONDeserializer.h"
#import "Teacher.h"
#import "Student.h"



@interface SignInViewController ()

@end


@implementation SignInViewController
@synthesize unameTextField, passwTextField, studentteachercontrol, signinButton, rows,teacher, student;

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
    unameTextField.backgroundColor = [UIColor whiteColor];
    passwTextField.backgroundColor = [UIColor whiteColor];
    [signinButton.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [signinButton.layer setBorderWidth: 1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signinButton:(id)sender {
    //use switch? or detect automatically?
    if(studentteachercontrol.selectedSegmentIndex == 1){//Teacher selected, if query to find in student is empty //where to check if uname and passw are correct?
        
        NSLog(@"something");
        if([[unameTextField text] isEqualToString:@""] || [[passwTextField text] isEqualToString:@""] ) {
            [self alertStatus:@"Please enter your username and password" :@"Login Failed!"];
        } else {
        //////////
            NSString *post =[NSString stringWithFormat:@"tuname=%@&tpassw=%@",[unameTextField text],[passwTextField text]];
            NSLog(@"%@",post);
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
            [request setURL:[NSURL URLWithString:@"http://lsucptg434gb.summerhost.info/app_file/tsign_in.php"]];
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
            
            NSLog(@"Array: %@",rows); //Log json
            
            if([rows count] == 0){
                NSLog(@"nothing returned\n");
                [self alertStatus:@"Incorrect username or password" :@"Login Failed!"];
            } else {
                NSLog(@"dictionary count = %i",[rows count]);
                NSDictionary *dictTwo = [rows objectAtIndex: 0]; //why do we do this?
        //////       // postFirstName.text = [dictTwo objectForKey:@"first_name"]; //print first_name from record 8 "carrot"
                [self performSegueWithIdentifier:@"SignInToTHome" sender:sender];
            }
        }
        /*
        NSString *jsonreturn = [[NSString alloc] initWithContentsOfURL:url];
        
        NSLog(jsonreturn); // Log json as string
        
        NSData *jsonData = [jsonreturn dataUsingEncoding:NSUTF32BigEndianStringEncoding];
        NSError *error = nil;
        
        // In "real" code you should surround this with try and catch
        NSDictionary * dict = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:&error];
        if (dict)
        {
            rows = [dict objectForKey:@"records"]; //select jsonarray called "records"
        }
        
        NSLog(@"Array: %@",rows); //Log json
        */
        
        

    } else if(studentteachercontrol.selectedSegmentIndex == 0){//Student selected
        
        if([[unameTextField text] isEqualToString:@""] || [[passwTextField text] isEqualToString:@""] ) {
            [self alertStatus:@"Please enter your username and password" :@"Login Failed!"];
        } else {
            //////////
            NSString *post =[NSString stringWithFormat:@"suname=%@&spassw=%@",[unameTextField text],[passwTextField text]];
            
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
            [request setURL:[NSURL URLWithString:@"http://lsucptg434gb.summerhost.info/app_file/ssign_in.php"]];
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
            
            NSLog(@"Student Array: %@",rows); //Log json
            
            if([rows count] == 0){
                NSLog(@"nothing returned\n");
                [self alertStatus:@"Incorrect username or password" :@"Login Failed!"];
            } else {
                NSLog(@"dictionary count = %i",[rows count]);
                NSDictionary *dictTwo = [rows objectAtIndex: 0]; //why do we do this?
                //////       // postFirstName.text = [dictTwo objectForKey:@"first_name"]; //print first_name from record 8 "carrot"
                [self performSegueWithIdentifier:@"SignInToSHome" sender:sender];
            }
        }
    
        
    }
    
}


- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    
    [alertView show];
}




- (IBAction)helpButton:(id)sender {
    
    [self performSegueWithIdentifier:@"SignInToForgotPassword" sender:sender];
    
}

- (void) backgroundTapHideKeyboard:(id)sender{
    
    [unameTextField resignFirstResponder];
    [passwTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == unameTextField) {
		[textField resignFirstResponder];
		[passwTextField becomeFirstResponder];
	}
	else if (textField == passwTextField) {
		[textField resignFirstResponder];
	}
	return YES;
}


- (void) viewWillAppear:(BOOL)animated  {
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}


- (IBAction)returnToSignInActionForSegue:(UIStoryboardSegue *)returnSegue {
    
    // do useful actions here.
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"SignInToTHome"])
    {
        // Get reference to the destination view controller
        THomeViewController *thomevc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        NSDictionary *dictTwo = [rows objectAtIndex: 0];
        teacher = [[Teacher alloc] initWithId:[dictTwo objectForKey:@"tid"]firstName:(NSString *)[dictTwo objectForKey:@"tfname"] lastName:(NSString *)[dictTwo objectForKey:@"tlname"] email:[dictTwo objectForKey:@"temail"] userName:[dictTwo objectForKey:@"tuname"] password:(NSString *)[dictTwo objectForKey:@"tpassw"] officeLocation:(NSString *)[dictTwo objectForKey:@"location"] officeHours:(NSString *)[dictTwo objectForKey:@"hours"]];
       /* teacher.tid = [dictTwo objectForKey:@"tid"];
        teacher.tfname = [dictTwo objectForKey:@"tfname"];
        teacher.tlname = [dictTwo objectForKey:@"tlname"];
        teacher.tuname = [dictTwo objectForKey:@"tuname"];
        teacher.temail = [dictTwo objectForKey:@"temail"];
        teacher.tpassw = [dictTwo objectForKey:@"tpassw"];
        teacher.office = [dictTwo objectForKey:@"location"];
        teacher.hours = [dictTwo objectForKey:@"hours"];*/
        NSLog(@"teacher id from signin = %@",teacher.tid);
        NSLog(@"sgja; %@",[dictTwo objectForKey:@"tid"]);
        [thomevc setTeacher:teacher];
    } else if ([[segue identifier] isEqualToString:@"SignInToSHome"])
    {
        
        // Get reference to the destination view controller
        SHomeViewController *shomevc = [segue destinationViewController];
        NSDictionary *dictTwo = [rows objectAtIndex: 0];
        student = [[Student alloc] initWithId:[dictTwo objectForKey:@"sid"] firstName:[dictTwo objectForKey:@"sfname"] lastName:[dictTwo objectForKey:@"slname"] email:[dictTwo objectForKey:@"semail"] userName:[dictTwo objectForKey:@"suname"] password:[dictTwo objectForKey:@"spassw"]];
        NSLog(@"Student id from signin =%@", student.sid);
        [shomevc setStudent:student];
        
        
        // Pass any objects to the view controller here, like...
        //[shomevc setMyObjectHere:object];
    }
}

@end
