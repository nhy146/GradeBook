//
//  THomeViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/10/13.
//
//

#import <UIKit/UIKit.h>
#import "Teacher.h"
#import "Course.h"

@interface THomeViewController : UIViewController
- (IBAction)signoutButton:(id)sender;
- (IBAction)newcourseButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *courseTable;
- (IBAction)editButton:(id)sender;
- (IBAction)helpButton:(id)sender;
@property (strong, nonatomic) NSMutableArray *dataArray;
- (IBAction)returnActionForSegue:(UIStoryboardSegue *)returnSegue;
@property (strong, nonatomic) NSString *teacherId;
@property (strong, nonatomic) NSArray *rows;
@property (strong, nonatomic) Teacher *teacher;
@property (strong, nonatomic) Course *course;


@end
