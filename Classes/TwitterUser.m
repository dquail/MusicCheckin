//
//  TwitterUser.m
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TwitterUser.h"

@implementation TwitterUser
@synthesize username, password;

- (TwitterUser *) initWithUsername:(NSString *) user password:(NSString *)pass
{
	if (self = [super init])
	{
		self.username = user;
		self.password = pass;
	}
	return self;
}

+ (id)fromDefaults
{
	TwitterUser *user;
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	NSData *data = [defaults objectForKey:@"twitterUser"];
	
	user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
	return user;	
}

- (void) savetoDefaults{
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	NSLog(@"Saving %@ %@", self.username, self.password);
	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
	
	[userDefaults setObject:data forKey:@"twitterUser"];	
	[userDefaults release];
}

- (BOOL) validateUser{

	NSString *url = [NSString stringWithFormat:@"http://%@:%@@api.twitter.com/1/account/verify_credentials.xml",
					 self.username, self.password ];
	NSString *escapedUrl = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; 
	NSLog(@"%@", escapedUrl);
	NSMutableURLRequest *theRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
															cachePolicy:NSURLRequestUseProtocolCachePolicy
														timeoutInterval:20.0];
	[theRequest setHTTPMethod:@"GET"];
	//NSString *bodyUnencoded = [NSString stringWithFormat:@"status=%@", escapedMessage];
	//NSString *theRequestBody = [bodyUnencoded stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; 
	//[theRequest setHTTPBody:[nil dataUsingEncoding:NSASCIIStringEncoding]];
	//NSLog(@"%@", theRequest);
	
	//NSURLResponse *response;
	NSHTTPURLResponse *response;
	NSError *error;
	NSData *result = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&response error:&error];

	if ([response statusCode]!= 200)
	{
		return FALSE;
	}
	else {
		return TRUE;
	}

	
	
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject: self.username forKey: @"username"];
	[aCoder encodeObject: self.password forKey: @"password"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init])
	{
		self.username = [aDecoder decodeObjectForKey:@"username"];
		self.password = [aDecoder decodeObjectForKey:@"password"];
	}

	return self;
}
@end
