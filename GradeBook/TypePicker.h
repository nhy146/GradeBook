//
//  TypePicker.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 6/7/13.
//
//

#import <UIKit/UIKit.h>

@interface TypePicker : UIPickerView
//@property (strong, nonatomic) NSDateFormatter * dateFormatter;
@property (strong, nonatomic) UITextField *textField;
-(id) initWithTypeString: (NSString*) typeString forTextField:(UITextField*)textField;

@end
