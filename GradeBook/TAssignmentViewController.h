//
//  TAssignmentViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/19/13.
//
//

#import <UIKit/UIKit.h>

@interface TAssignmentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *assignmentLabel;
@property (weak, nonatomic) IBOutlet UITableView *scoreTable;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end
