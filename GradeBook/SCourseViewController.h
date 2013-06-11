//
//  SCourseViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/9/13.
//
//

#import <UIKit/UIKit.h>

@interface SCourseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *coursenameLabel;

- (IBAction)homeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *assignmentTable;
- (IBAction)contactButton:(id)sender;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end
