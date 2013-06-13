//
//  SHomeViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/6/13.
//
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface SHomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *courseTable;
- (IBAction)enrollButton:(id)sender;
- (IBAction)editButton:(id)sender;
- (IBAction)signoutBurron:(id)sender;
- (void) backgroundTapHideKeyboard:(id)sender;
@property (strong, nonatomic) NSArray *listData;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) NSArray *rows;
@property (strong, nonatomic) NSString *studentID;
@property (strong, nonatomic) Student *student;
@end
