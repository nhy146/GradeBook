//
//  TAssignmentViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/19/13.
//
//

#import <UIKit/UIKit.h>
#import "AssignmentDataTable.h"
#import "Item.h"

@interface TAssignmentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *assignmentLabel;
@property (weak, nonatomic) IBOutlet UITableView *scoreTable;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) AssignmentDataTable *setting;
@property (strong, nonatomic) UILabel *fname;
@property (strong, nonatomic) UILabel *lname;
//@property (strong, nonatomic) UILabel *sid;;
@property (strong, nonatomic) IBOutlet UITextField *scoreField;
@property (strong, nonatomic) IBOutlet Item *item;
@property (nonatomic, retain) IBOutlet UITableViewCell *settingsCell;
@property (nonatomic, retain) NSMutableArray *listOfRows;

- (IBAction)backButton:(id)sender;
- (IBAction)reportsButton:(id)sender;

@end
