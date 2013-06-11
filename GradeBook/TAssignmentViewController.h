//
//  TAssignmentViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/19/13.
//
//

#import <UIKit/UIKit.h>

@interface TAssignmentViewController : UIViewController
- (IBAction)backButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *assignmentLabel;
@property (weak, nonatomic) IBOutlet UITableView *scoreTable;
- (IBAction)reportsButton:(id)sender;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end
