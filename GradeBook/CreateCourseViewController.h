//
//  CreateCourseViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/6/13.
//
//

#import <UIKit/UIKit.h>
#import "DatePicker.h"

@interface CreateCourseViewController : UIViewController
- (IBAction)cancelButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *cnameTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITextField *ekeyTextField;
@property (weak, nonatomic) IBOutlet UITextField *startTextField;
@property (weak, nonatomic) IBOutlet UITextField *endTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *schoolTextField;
- (IBAction)createcourseButton:(id)sender;
@property (strong, nonatomic) DatePicker *startDatePicker;
@property (strong, nonatomic) DatePicker *endDatePicker;
@property (nonatomic, readonly) UIToolbar *accessoryView;
- (IBAction)backgroundTapHideKeyboard:(id)sender;


@end
