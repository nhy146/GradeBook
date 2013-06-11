//
//  EditViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/6/13.
//
//

#import <UIKit/UIKit.h>
#import "Teacher.h"
#import "Student.h"

@interface EditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UILabel *fnameField;
@property (weak, nonatomic) IBOutlet UILabel *lnameField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwTextField;
@property (strong, nonatomic) Teacher *teacher;
@property (strong, nonatomic) Student *student;


- (IBAction)doneButton:(id)sender;
- (IBAction)cancelButton:(id)sender;
- (IBAction) backgroundTapHideKeyboard:(id)sender;

@end
