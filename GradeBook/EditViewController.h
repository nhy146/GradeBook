//
//  EditViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/6/13.
//
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UITextField *fnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwTextField;
- (IBAction)doneButton:(id)sender;
- (IBAction)cancelButton:(id)sender;
- (IBAction) backgroundTapHideKeyboard:(id)sender;

@end
