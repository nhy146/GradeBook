//
//  TAssignmentViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/19/13.
//
//

#import <UIKit/UIKit.h>
#import "TableData.h"
#import "Item.h"

@interface TAssignmentViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *scoreField;
@property (strong, nonatomic) IBOutlet Item *item;
@property (nonatomic, retain) IBOutlet UITableViewCell *settingsCell;
@property (weak, nonatomic) IBOutlet UILabel *assignmentLabel;
@property (weak, nonatomic) IBOutlet UITableView *scoreTable;

////////////////////
@property (nonatomic, retain) NSMutableArray *listOfRows;
@property (nonatomic, retain) TableData *setting;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) UILabel *fname;
@property (strong, nonatomic) UILabel *lname;

- (IBAction)backButton:(id)sender;
- (IBAction)reportsButton:(id)sender;

@end
