//
//  EnrollViewController.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/6/13.
//
//

#import "EnrollViewController.h"

@interface EnrollViewController ()

@end

@implementation EnrollViewController
@synthesize ekeyTextField, cidTextField, courseLabel, teacherLabel;


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
    cidTextField.backgroundColor = [UIColor whiteColor];
    ekeyTextField.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)doneButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)backgroundTapHideKeyboard:(id)sender{
    
    [cidTextField resignFirstResponder];
    [ekeyTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == cidTextField) {
		[textField resignFirstResponder];
		[ekeyTextField becomeFirstResponder];
	}
	else if (textField == ekeyTextField) {
		[textField resignFirstResponder];
	}
	return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField == cidTextField){
        courseLabel.text = @"The Course Name"; //put course name
        teacherLabel.text = @"The Teacher's Name"; //put teacher's name
    }
	/*CGRect viewFrame = self.view.frame;
	viewFrame.origin.y += animatedDistance;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
	[self.view setFrame:viewFrame];
 	[UIView commitAnimations];*/
    
    //do checking on textfields here
    
}

@end
