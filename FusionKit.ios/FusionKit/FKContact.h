//
//  FKContact.h
//  FusionKit.C
//
//  Created by Maxthon Chan on 13-3-5.
//
//

#import <Foundation/Foundation.h>

@interface FKContact : NSObject <NSCoding>

@property NSString *displayName;
@property NSString *handle;
@property NSURL *avatar;

@end
