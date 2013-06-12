//
//  Teacher.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 6/6/13.
//
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject
@property (strong,nonatomic) NSString *tid;
@property (strong,nonatomic) NSString *tfname;
@property (strong,nonatomic) NSString *tlname;
@property (strong,nonatomic) NSString *temail;
@property (strong,nonatomic) NSString *tuname;
@property (strong,nonatomic) NSString *tpassw;
@property (strong,nonatomic) NSString *office;
@property (strong,nonatomic) NSString *hours;

-(id)initWithId:(NSString *)tid firstName:(NSString *)tfname lastName:(NSString *)tlname email:(NSString *)temail userName:(NSString *)tuname password:(NSString *)tpassw officeLocation:(NSString *)office officeHours:(NSString *)hours;
-(id)initNull;
@end
