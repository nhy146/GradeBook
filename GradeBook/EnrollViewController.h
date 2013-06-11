//
//  EnrollViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/6/13.
//
//

#import <UIKit/UIKit.h>

@interface EnrollViewController : UIViewController
- (IBAction)cancelButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *cidTextField;
@property (weak, nonatomic) IBOutlet UITextField *ekeyTextField;
- (IBAction)doneButton:(id)sender;
- (IBAction) backgroundTapHideKeyboard:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *courseLabel;
@property (weak, nonatomic) IBOutlet UILabel *teacherLabel;

@end
