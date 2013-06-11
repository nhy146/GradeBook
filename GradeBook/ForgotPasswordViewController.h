//
//  ForgotPasswordViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/10/13.
//
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordViewController : UIViewController
- (IBAction)cancelButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
- (IBAction)sendpasswButton:(id)sender;
- (IBAction)openemailButton:(id)sender;
- (IBAction) backgroundTapHideKeyboard:(id)sender;

@end
