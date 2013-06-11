//
//  DatePicker.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/20/13.
//
//

#import "DatePicker.h"

@implementation DatePicker
@synthesize dateFormatter, textField;

/*- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(id)initWithDateFormatString:(NSString *)dateFormatString forTextField:(UITextField *) textField withDatePickerMode: (UIDatePickerMode) datePickerMode {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.datePickerMode = datePickerMode;
    self.textField = textField;
    
    self.dateFormatter = [[NSDateFormatter alloc]init];
    self.dateFormatter.dateFormat = dateFormatString;
    
    [self addTarget:self action:@selector(dateSelected:) forControlEvents:UIControlEventValueChanged];
    
  
    return self;
}

-(void)setDate:(NSDate *)date{
    [super setDate:date];
    [self dateSelected:nil];
}

-(void)dateSelected:(id) sender{
    self.textField.text = [self.dateFormatter stringFromDate:self.date];
    
}
@end
