//
//  MusicCheckinAppDelegate.m
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MusicCheckinAppDelegate.h"

@implementation MusicCheckinAppDelegate

@synthesize window, mainNavigation;


- (void)applicationDidFinishLaunching:(UIApplication *)application
{
	UIWindow *appWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
 
    self.window = appWindow;
	// Read the Users setttings
	TwitterUser *twitterUser = [TwitterUser fromDefaults];
	
	if (twitterUser)
	{
		NowPlayingViewController *nowPlayingViewController = [[NowPlayingViewController alloc]
															  initWithNibName:nil bundle:nil];
		mainNavigation= [[UINavigationController alloc]
						 initWithRootViewController:nowPlayingViewController];
		[nowPlayingViewController release];
	}
	else {
		AccountViewController *accountViewController = [[AccountViewController alloc] 
														initWithNibName:nil bundle:nil];
		mainNavigation= [[UINavigationController alloc]
										   initWithRootViewController:accountViewController];
		[accountViewController release];
	}

	[self.window addSubview:[mainNavigation view]];
	[self.window makeKeyAndVisible];
	

    [appWindow release];
	
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
