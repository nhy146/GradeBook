//
//  Course.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 6/6/13.
//
//

#import <Foundation/Foundation.h>

@interface Course : NSObject
@property (strong,nonatomic) NSString *cid;
@property (strong,nonatomic) NSString *tid;
@property (strong,nonatomic) NSString *cname;
@property (strong,nonatomic) NSString *desc;
@property (strong,nonatomic) NSString *ekey;
@property (strong,nonatomic) NSString *start;
@property (strong,nonatomic) NSString *end;
@property (strong,nonatomic) NSString *school;

-(id)initWithId:(NSString *)cid teacherId:(NSString *)tid name:(NSString *)cname description:(NSString *)desc enrollmentKey:(NSString *)ekey startDate:(NSString *)start endDate:(NSString *)end school:(NSString *)school;
@end
