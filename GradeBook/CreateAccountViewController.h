//
//  CreateAccountViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/6/13.
//
//

#import <UIKit/UIKit.h>

@interface CreateAccountViewController : UIViewController{
    NSArray *rows;
}
//@property (weak, nonatomic) IBOutlet UITableView *stpicker;
@property (weak, nonatomic) IBOutlet UITextField *fnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *unameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwTextField;
@property (nonatomic, retain) NSArray *rows;
- (IBAction)createacctButton:(id)sender;
- (IBAction)cancelButton:(id)sender;
- (IBAction) backgroundTapHideKeyboard:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)textFieldReturn:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *stsegcontrol;

@property (weak, nonatomic) IBOutlet UITextField *activeField;
@property (strong, nonatomic) NSArray *listData;




@end
