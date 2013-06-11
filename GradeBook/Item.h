//
//  Item.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 6/6/13.
//
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property (strong,nonatomic) NSString *iid;
@property (strong,nonatomic) NSString *iname;
@property (strong,nonatomic) NSString *type;
@property (strong,nonatomic) NSString *points;
@property (strong,nonatomic) NSString *cid;
@property (strong,nonatomic) NSString *end;
@property (strong,nonatomic) NSString *hidden;

-(id)initWithId:(NSString *)iid name:(NSString *)name type:(NSString *)type pointsPossible:(NSString *)points courseId:(NSString *)cid endDate:(NSString *)end hidden:(NSString *)hidden;

@end
