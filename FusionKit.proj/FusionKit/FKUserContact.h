//
//  FKUserContact.h
//  FusionKit
//
//  Created by John Shi on 13-3-6.
//
//

#import <Foundation/Foundation.h>
#import "FKContact.h"

@interface FKUserContact :  NSObject <NSCoding>
@property id ID;
@property NSArray *ucs;
@property id user;
@property NSString *name;
@property FKContact *avatar;
@end