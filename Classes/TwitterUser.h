//
//  TwitterUser.h
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TwitterUser : NSObject <NSCoding>{
	NSString *username;
	NSString *password;

}

@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *password;

- (TwitterUser *) initWithUsername:(NSString *) user password:(NSString *)pass;
+ (TwitterUser *) fromDefaults;
- (void) savetoDefaults;
-(BOOL) validateUser;
@end
