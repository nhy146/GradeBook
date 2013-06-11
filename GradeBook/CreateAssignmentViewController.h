//
//  CreateAssignmentViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/9/13.
//
//

#import <UIKit/UIKit.h>

@interface CreateAssignmentViewController : UIViewController
- (IBAction)cancelButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *assignmentnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *typeTextField;
@property (weak, nonatomic) IBOutlet UITextField *pointspossibleTextField;
@property (weak, nonatomic) IBOutlet UITextField *duedateTextField;
@property (weak, nonatomic) IBOutlet UIButton *createButton;
@property (strong, nonatomic) NSArray *typeList;
@property (strong, nonatomic) NSString *cid;
@property (strong, nonatomic) UIPickerView *typePicker;
@property (nonatomic, readonly) UIToolbar *accessoryView;

- (IBAction) backgroundTapHideKeyboard:(id)sender;
- (IBAction) createButtonPressed:(id)sender;


@end
