//
//  TableData.h
//  GradeBook
//
//  Created by major on 6/11/13.
//
//

#import <Foundation/Foundation.h>

@interface TableData : NSObject

@property (nonatomic, retain) NSString *fname;
@property (nonatomic, retain) NSString *lname;
@property (nonatomic, retain) NSString *score;

-(id) initTableDataWithFirstName: (NSString *)firstName LastName:(NSString *)lastName Score:(NSString *)scoreInput;
@end
