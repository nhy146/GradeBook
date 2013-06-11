//
//  Course.m
//  GradeBook
//
//  Created by Nissa Nishiyama on 6/6/13.
//
//

#import "Course.h"

@implementation Course

-(id)initWithId:(NSString *)cid teacherId:(NSString *)tid name:(NSString *)cname description:(NSString *)desc enrollmentKey:(NSString *)ekey startDate:(NSString *)start endDate:(NSString *)end school:(NSString *)school{
    self = [super init];
    
    if (self) {
        
        _cid = cid;
        
        _tid = tid;
        
        _cname = cname;
        
        _desc = desc;
        
        _ekey = ekey;
        
        _start = start;
        
        _end = end;
        
         _school = school;
        
        return self;
        
    }
    
    return nil;
}

@end
