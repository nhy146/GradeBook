//
//  Item.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 6/6/13.
//
//

#import "Item.h"

@implementation Item


-(id)initWithId:(NSString *)iid name:(NSString *)name type:(NSString *)type pointsPossible:(NSString *)points courseId:(NSString *)cid endDate:(NSString *)end hidden:(NSString *)hidden{
    self = [super init];
    
    if (self) {
        
        _iid = iid;
        
        _iname = name;
        
        _type = type;
        
         _points = points;
        
        _cid = cid;
        
        _end = end;
        
        _hidden = hidden;
        
        return self;
        
    }
    
    return nil;
}



@end
