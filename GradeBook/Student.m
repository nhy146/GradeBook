//
//  Student.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 6/6/13.
//
//

#import "Student.h"

@implementation Student

-(id)initWithId:(NSString *)sid firstName:(NSString *)sfname lastName:(NSString *)slname email:(NSString *)semail userName:(NSString *)suname password:(NSString *)spassw {
    self = [super init];
    
    if (self) {
        
        _sid = sid;
        
        _sfname = sfname;
        
        _slname = slname;
        
        _semail = semail;
        
        _suname = suname;
        
        _spassw = spassw;
        

        
        return self;
        
    }
    
    return nil;
}

-(id)initNull {
    self = [super init];
    if (self) {
        _sid = @"00000000";
        _sfname = @"nofname";
        _slname = @"nolname";
        _semail = @"nosemail";
        _suname = @"nosuname";
        _spassw = @"nospassw";
        
        return self;
    }
    return nil;
}

@end
