//
//  AssignmentDataTable.h
//  GradeBook
//
//  Created by major on 6/10/13.
//
//

#import <Foundation/Foundation.h>

@interface AssignmentDataTable : NSObject

@property (nonatomic, retain) NSMutableArray *sid;
@property (nonatomic, retain) NSMutableArray *fname;
@property (nonatomic, retain) NSMutableArray *lname;
@property (nonatomic, retain) NSMutableArray *score;

-(void) initTableData;

@end
