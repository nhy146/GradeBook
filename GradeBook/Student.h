//
//  Student.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 6/6/13.
//
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (strong,nonatomic) NSString *sid;
@property (strong,nonatomic) NSString *sfname;
@property (strong,nonatomic) NSString *slname;
@property (strong,nonatomic) NSString *semail;
@property (strong,nonatomic) NSString *suname;
@property (strong,nonatomic) NSString *spassw;

-(id)initWithId:(NSString *)sid firstName:(NSString *)sfname lastName:(NSString *)slname email:(NSString *)semail userName:(NSString *)suname password:(NSString *)spassw;
-(id)initNull;

@end
