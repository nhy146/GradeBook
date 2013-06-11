//
//  SCourseViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/9/13.
//
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "Course.h"  
#import "Item.h"

@interface SCourseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *coursenameLabel;

- (IBAction)homeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *assignmentTable;
- (IBAction)contactButton:(id)sender;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) Course *course;
@property (strong, nonatomic) Student *student;
@property (strong, nonatomic) NSArray *rows;
@property (strong, nonatomic) Item *item;
@end
