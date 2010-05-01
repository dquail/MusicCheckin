//
//  MusicCheckinAppDelegate.m
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MusicCheckinAppDelegate.h"
#import "MusicCheckinViewController.h"

@implementation MusicCheckinAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
