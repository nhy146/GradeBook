//
//  DatePicker.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/20/13.
//
//

#import <UIKit/UIKit.h>

@interface DatePicker : UIDatePicker
@property (strong, nonatomic) NSDateFormatter * dateFormatter;
@property (strong, nonatomic) UITextField *textField;
-(id) initWithDateFormatString: (NSString*) dateFormatString forTextField:(UITextField*)textField withDatePickerMode:(UIDatePickerMode) datePickerMode;
@end
