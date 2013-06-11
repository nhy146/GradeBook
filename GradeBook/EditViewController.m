//
//  EditViewController.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/6/13.
//
//

#import "EditViewController.h"
#import "CJSONDeserializer.h"

@interface EditViewController ()

@end

@implementation EditViewController
@synthesize fnameField, lnameField, emailTextField, passwTextField,teacher,student;
CGFloat animatedDistance;

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
    // What should I sent to check whether it is student or teacher? Check whether the student.id and the teacher.id, if they are not equal 0 then change that. Can't since set object. So NSInterger ?
    
    if(![teacher.tid isEqualToString:@"00000000"]) {
        // if teacher
        fnameField.text = teacher.tfname;
        lnameField.text = teacher.tlname;
        emailTextField.placeholder = teacher.temail;
    } else if (![student.sid isEqualToString:@"00000000"]) {
        // if student
        fnameField.text = student.sfname;
        lnameField.text = student.slname;
        emailTextField.placeholder = student.semail;
    }
    
    emailTextField.backgroundColor = [UIColor whiteColor];
    passwTextField.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButton:(id)sender {
    //code to update?? or do as leave textbox?
    //[self.navigationController popViewControllerAnimated:YES];
    NSString *post = [[NSString alloc] init];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    
    if(![teacher.tid isEqualToString:@"00000000"]) {
        // if teacher
        post =[NSString stringWithFormat:@"tid=%@&temail=%@&tpassw=%@",teacher.tid,[emailTextField text],[passwTextField text]];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];

        [request setURL:[NSURL URLWithString:@"http://lsucptg434gb.summerhost.info/app_file/tupdate_info.php"]];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        NSHTTPURLResponse* urlResponse = nil;
        NSError *error = [[NSError alloc] init];
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        NSLog(@"%@", urlResponse);
        NSDictionary * dict = [[CJSONDeserializer deserializer] deserializeAsDictionary:responseData error:&error];
        NSString *result = [[NSString alloc] init];
        if (dict)
        {
            result = [dict objectForKey:@"success"];
        }
        
        if ([result intValue] == 1) {
            [self alertStatus:@"Update successfule":@"Congrat"];
        } else {
            [self alertStatus:@"Update failed. Please try again":@"Oh oh"];
        }


        
    } else if (![student.sid isEqualToString:@"00000000"]) {
        // if student
        post =[NSString stringWithFormat:@"sid=%@&semail=%@&spassw=%@",student.sid,[emailTextField text],[passwTextField text]];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];

        [request setURL:[NSURL URLWithString:@"http://lsucptg434gb.summerhost.info/app_file/supdate_info.php"]];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        NSHTTPURLResponse* urlResponse = nil;
        NSError *error = [[NSError alloc] init];
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        NSDictionary * dict = [[CJSONDeserializer deserializer] deserializeAsDictionary:responseData error:&error];
        NSString *result = [[NSString alloc] init];
        if (dict)
        {
            result = [dict objectForKey:@"success"];
        }
        
        if ([result intValue] == 1) {
            [self alertStatus:@"Update successfule":@"Congrat"];
        } else {
            [self alertStatus:@"Update failed. Please try again":@"Oh oh"];
        }
        


        
    }

    
   
    
    /*NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    
    
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSDictionary * dict = [[CJSONDeserializer deserializer] deserializeAsDictionary:responseData error:&error];
    NSString *result = [[NSString alloc] init];
    if (dict)
    {
        result = [dict objectForKey:@"success"];
    }
    
    if ([result intValue] == 1) {
        [self alertStatus:@"Update successfule":@"Congrat"];
    } else {
        [self alertStatus:@"Update failed. Please try again":@"Oh oh"];
    }*/

    
    
    
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


- (IBAction)cancelButton:(id)sender {
    int viewIndex = [[self.navigationController viewControllers] count];
    [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex: viewIndex - 1] animated:YES];

}


- (void) backgroundTapHideKeyboard:(id)sender{
    
    [emailTextField resignFirstResponder];
    [passwTextField resignFirstResponder];

    NSLog(@"background tap");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"hit return");
	if (textField == emailTextField) {
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
@end
