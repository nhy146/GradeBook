//
//  TableData.m
//  GradeBook
//
//  Created by major on 6/11/13.
//
//

#import "TableData.h"

@implementation TableData

-(id) initTableDataWithFirstName: (NSString *)firstName LastName:(NSString *)lastName Score:(NSString *)scoreInput {
	
	/*fname = [[NSString alloc] initWithString:firstName];
    lname = [[NSString alloc] initWithString:lastName];
	score = [[NSString alloc] initWithString:scoreInput];*/
    
self = [super init];

if (self) {
    _fname = firstName;
    _lname = lastName;
    _score = scoreInput;
    
    
    return self;
    
}

return nil;


}



@end
