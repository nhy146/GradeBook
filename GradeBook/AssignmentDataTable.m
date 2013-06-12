//
//  AssignmentDataTable.m
//  GradeBook
//
//  Created by major on 6/10/13.
//
//

#import "AssignmentDataTable.h"

@implementation AssignmentDataTable

@synthesize sid;
@synthesize fname;
@synthesize lname;
@synthesize score;

- (void) initTableData {
    sid = [[NSMutableArray alloc] init];
    fname = [[NSMutableArray alloc] init];
    lname = [[NSMutableArray alloc] init];
    score = [[NSMutableArray alloc] init];
}

@end
