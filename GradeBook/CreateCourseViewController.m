//
//  CreateCourseViewController.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/6/13.
//
//

#import "CreateCourseViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DatePicker.h"

@interface CreateCourseViewController ()

@end

@implementation CreateCourseViewController
@synthesize cnameTextField,descriptionTextView, ekeyTextField, startTextField, endTextField, schoolTextField, locationTextField, startDatePicker, endDatePicker, accessoryView; //activeField;
CGFloat		animatedDistance;

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
    cnameTextField.backgroundColor = [UIColor whiteColor];
    ekeyTextField.backgroundColor = [UIColor whiteColor];
    startTextField.backgroundColor = [UIColor whiteColor];
    endTextField.backgroundColor = [UIColor whiteColor];
    schoolTextField.backgroundColor = [UIColor whiteColor];
    locationTextField.backgroundColor = [UIColor whiteColor];
    
    [descriptionTextView.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [descriptionTextView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [descriptionTextView.layer setBorderWidth: 1.0];
    //[descriptionTextView.layer setCornerRadius: 5];
    [descriptionTextView.layer setMasksToBounds:YES];
    descriptionTextView.textColor = [UIColor lightGrayColor];
    descriptionTextView.text = @"Course description";
    
    self.startDatePicker = [[DatePicker alloc] initWithDateFormatString:@"MM/dd/yyy" forTextField:self.startTextField withDatePickerMode: UIDatePickerModeDate];
    self.endDatePicker = [[DatePicker alloc] initWithDateFormatString:@"MM/dd/yyy" forTextField:self.endTextField withDatePickerMode: UIDatePickerModeDate];
    
    self.startTextField.inputView = self.startDatePicker;
    self.endTextField.inputView = self.endDatePicker;
    
    startTextField.inputAccessoryView = self.accessoryView;
    endTextField.inputAccessoryView = self.accessoryView;
    
    self.startDatePicker.date = [NSDate date];
    self.endDatePicker.date = [NSDate date];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)createcourseButton:(id)sender {
    //checking and code to add course to db
    //[self.navigationController popViewControllerAnimated:YES];
}

- (void) backgroundTapHideKeyboard:(id)sender{
    
    [cnameTextField resignFirstResponder];
    [ekeyTextField resignFirstResponder];
    [descriptionTextView resignFirstResponder];
    [startTextField resignFirstResponder];
    [endTextField resignFirstResponder];
    [schoolTextField resignFirstResponder];
    [locationTextField resignFirstResponder];
    [startDatePicker resignFirstResponder];
    [endDatePicker resignFirstResponder];

    
    NSLog(@"background tap");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"hit return");
	if (textField == cnameTextField) {
		[textField resignFirstResponder];
		[descriptionTextView becomeFirstResponder];
	}
    else if (textField == descriptionTextView) {
		[textField resignFirstResponder];
        [startTextField becomeFirstResponder];
	}
    else if (textField == startTextField) {
		[textField resignFirstResponder];
        [endTextField becomeFirstResponder];
	}
    
	else if (textField == endTextField) {
		[textField resignFirstResponder];
        [locationTextField becomeFirstResponder];
	}
    else if (textField == locationTextField) {
		[textField resignFirstResponder];
        [schoolTextField becomeFirstResponder];
	}
    else if (textField == schoolTextField) {
		[textField resignFirstResponder];
        [ekeyTextField becomeFirstResponder];
	}
    else if (textField == ekeyTextField) {
		[textField resignFirstResponder];
	}
    
	return YES;
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    if (descriptionTextView.textColor == [UIColor lightGrayColor]) {
        descriptionTextView.text = @"";
        descriptionTextView.textColor = [UIColor blackColor];
    }
    
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
   
    if(textView.text.length == 0){
            textView.textColor = [UIColor lightGrayColor];
            textView.text = @"Course description";
    }
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

- (UIToolbar *)accessoryView {
    if ( accessoryView == nil ) {
        accessoryView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonItemStylePlain
        target:self
        action:@selector(dateSelected)];
        [accessoryView setItems:[NSArray arrayWithObject:doneButton]];
    }
    
    return accessoryView;
}

- (void) dateSelected {
    //NSInteger row = [self.startDatePicker selectedRowInComponent:0];
    
    if ( [startTextField isFirstResponder] ) {
        //startTextField.text = [locations objectAtIndex:row];
        [startTextField resignFirstResponder];
    } else {
        //
        //endTextField.text = [locations objectAtIndex:row];
        [endTextField resignFirstResponder];
    }
}


@end
