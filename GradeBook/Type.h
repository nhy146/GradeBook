//
//  Type.h
//  GradeBook
//
//  Created by Nissa Nishiyama on 6/6/13.
//
//

#import <Foundation/Foundation.h>

@interface Type : NSObject
@property (strong,nonatomic) NSString *cid;
@property (strong,nonatomic) NSString *type;
@property (strong,nonatomic) NSString *weight;

-(id)initWithId:(NSString *)cid type:(NSString *)type weight:(NSString *)weight;
@end
