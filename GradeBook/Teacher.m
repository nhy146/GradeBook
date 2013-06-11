//
//  Teacher.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 6/6/13.
//
//

#import "Teacher.h"

@implementation Teacher

-(id)initWithId:(NSString *)tid firstName:(NSString *)tfname lastName:(NSString *)tlname email:(NSString *)temail userName:(NSString *)tuname password:(NSString *)tpassw officeLocation:(NSString *)office officeHours:(NSString *)hours{
    self = [super init];
    
    if (self) {
        
        _tid = tid;
        
        _tfname = tfname;
        
        _tlname = tlname;
        
        _temail = temail;
        
        _tuname = tuname;
        
        _tpassw = tpassw;
        
        _office = office;
        
        _hours = hours;
        
        return self;
        
    }
    
    return nil;
}

-(id)initNull {
    self = [super init];
    if (self) {
        _tid = @"00000000";
        _tfname = @"nofname";
        _tlname = @"nolname";
        _temail = @"notemail";
        _tuname = @"notuname";
        _tpassw = @"notpassw";
        
        return self;
    }
    return nil;
}


@end
