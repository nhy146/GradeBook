//
//  CreateAssignmentViewController.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/9/13.
//
//

#import "CreateAssignmentViewController.h"
#import "Course.h"
#import "CJSONDeserializer.h"


@interface CreateAssignmentViewController ()

@end

@implementation CreateAssignmentViewController
@synthesize assignmentnameTextField, typeTextField, pointspossibleTextField, duedateTextField,cid,typeList,accessoryView,typePicker;
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
      NSLog(@"cid %@ ITEMS %@",cid,typeList);
	// Do any additional setup after loading the view.
    assignmentnameTextField.backgroundColor = [UIColor whiteColor];
    typeTextField.backgroundColor = [UIColor whiteColor];
    pointspossibleTextField.backgroundColor = [UIColor whiteColor];
    duedateTextField.backgroundColor = [UIColor whiteColor];
    
    //UIPickerView *typePicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    typePicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    typePicker.delegate = self;
    typePicker.dataSource = self;
    [typePicker setShowsSelectionIndicator:YES];
    typeTextField.inputView = typePicker;
    typeTextField.inputAccessoryView = self.accessoryView;
    
 

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goBack {
    int viewIndex = [[self.navigationController viewControllers] count];
    [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex: viewIndex - 1] animated:YES];

}

- (IBAction)cancelButton:(id)sender {
     //[self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:2] animated:YES];
    [self goBack];
   }

- (void) backgroundTapHideKeyboard:(id)sender{
    
    [assignmentnameTextField resignFirstResponder];
    [typeTextField resignFirstResponder];
    [pointspossibleTextField resignFirstResponder];
    [duedateTextField resignFirstResponder];
    NSLog(@"background tap");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"hit return");
	if (textField == assignmentnameTextField) {
		[textField resignFirstResponder];
		[typeTextField becomeFirstResponder];
	}
    else if (textField == typeTextField) {
		[textField resignFirstResponder];
        [pointspossibleTextField becomeFirstResponder];
	}
    else if (textField == pointspossibleTextField) {
		[textField resignFirstResponder];
        [duedateTextField becomeFirstResponder];
	}
    
    else if (textField == duedateTextField) {
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

- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    
    [alertView show];
}

-(void) alertSuccessful {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Success"
                                                        message:@"A item has been created"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Done", nil];
    [alertView show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        //Ok button pressed
    }
    else if (buttonIndex == 1) {
      //  [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:1] Animated:YES];
        [self goBack];
    }
}


- (IBAction) createButtonPressed:(id)sender {
    if([[assignmentnameTextField text] isEqualToString:@""] || [[typeTextField text] isEqualToString:@""] || [[pointspossibleTextField text] isEqualToString:@""] || [[duedateTextField text] isEqualToString:@""] ) {
        [self alertStatus:@"Please fill in all the field" :@"Create an Assignment Failed!"];
    } else {
        //////////
        NSString *post =[NSString stringWithFormat:@"iname=%@&type=%@&points=%@&cid=%@&due=%@",[assignmentnameTextField text],[typeTextField text],[pointspossibleTextField text],cid,[duedateTextField text]];
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
        [request setURL:[NSURL URLWithString:@"http://lsucptg434gb.summerhost.info/app_file/tcreate_new_item.php"]];
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
            [self alertSuccessful];
        } else {
            [self alertStatus:@"Failed to create a new assignment. Please try again":@"Problems"];
        }
    }
}


#pragma Picker Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return typeList.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [typeList objectAtIndex:row];
}

/*- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    typeTextField.text = (NSString *)[typeList objectAtIndex:row];
    
}*/

- (UIToolbar *)accessoryView {
    if ( accessoryView == nil ) {
        accessoryView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonItemStylePlain
                                                                                    target:self
                                                                                    action:@selector(typeSelected)];
        [accessoryView setItems:[NSArray arrayWithObject:doneButton]];
    }
    
    return accessoryView;
}

- (void) typeSelected {
    NSInteger row = [typePicker selectedRowInComponent:0];
    
    //if ( [typeTextField isFirstResponder] ) {
        //startTextField.text = [locations objectAtIndex:row];
    typeTextField.text = [typeList objectAtIndex:row];
        [typeTextField resignFirstResponder];
    }

@end
