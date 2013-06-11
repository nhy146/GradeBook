//
//  SignInViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/8/13.
//
//

#import <UIKit/UIKit.h>
#import "Teacher.h"
#import "Student.h"

@interface SignInViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *studentteachercontrol;


@property (weak, nonatomic) IBOutlet UITextField *unameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwTextField;
- (IBAction)signinButton:(id)sender;
//- (IBAction)createacctButton:(id)sender;
- (IBAction)helpButton:(id)sender;
- (IBAction) backgroundTapHideKeyboard:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *signinButton;
@property (strong, nonatomic) NSArray *rows;
@property (strong, nonatomic) Teacher *teacher;
@property (strong, nonatomic) Student *student;


@end
