//
//  CreateTypeViewController.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 5/8/13.
//
//

#import <UIKit/UIKit.h>

@interface CreateTypeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *typelistTable;
- (IBAction)createtypeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UITextField *typenameTextField;
- (IBAction)backButton:(id)sender;
@property (strong, nonatomic) NSMutableArray *dataArray;


@end
