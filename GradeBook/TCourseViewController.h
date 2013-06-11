//
//  TCourseViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/9/13.
//
//

#import <UIKit/UIKit.h>
#import "Course.h"
#import "Item.h"

@interface TCourseViewController : UIViewController
- (IBAction)homeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *coursenameLabel;
- (IBAction)editcourseinfoButton:(id)sender;
- (IBAction)newassignmentButton:(id)sender;
- (IBAction)newtypeButton:(id)sender;
- (IBAction)reportsButton:(id)sender;
- (IBAction)contactButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *assignmentTable;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) Course *course;
@property (strong, nonatomic) Item *item;
@property (strong, nonatomic) NSMutableArray *typeList;


@end
