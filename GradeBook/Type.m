//
//  Type.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 6/6/13.
//
//

#import "Type.h"

@implementation Type

-(id)initWithId:(NSString *)cid type:(NSString *)type weight:(NSString *)weight{
    self = [super init];
    
    if (self) {
        
        _cid = cid;
        
        _type = type;
        
        _weight = weight;

        
        return self;
        
    }
    
    return nil;
}


@end
