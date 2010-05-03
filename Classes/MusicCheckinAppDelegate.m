//
//  MusicCheckinAppDelegate.m
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MusicCheckinAppDelegate.h"

@implementation MusicCheckinAppDelegate

@synthesize window, mainNavigation, tabBarController, accountController, nowPlayingController, worldPlayingController;

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
	UIWindow *appWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.tabBarController = [[UITabBarController alloc] init];
	/*World Playing controller*/
	
	UIImage * worldImage = [UIImage imageNamed: @"Globe-Icon.png"]; 
	self.worldPlayingController = [[WorldPlayingViewController alloc] initWithNibName:nil bundle:nil];
	self.worldPlayingController.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Trending"
																image:worldImage tag:1] autorelease];

	UIImage * accountImage = [UIImage imageNamed: @"account.png"]; 
	self.accountController = [[AccountViewController alloc] initWithNibName:nil bundle:nil];
	self.accountController.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Account"
																			image:accountImage tag:2] autorelease];

	UIImage * playingImage = [UIImage imageNamed: @"music_icon.png"]; 
	self.nowPlayingController = [[NowPlayingViewController alloc] initWithNibName:nil bundle:nil];
	self.nowPlayingController.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Now Playing"
																	   image:playingImage tag:0] autorelease];


	self.tabBarController.viewControllers = [NSArray arrayWithObjects:
										self.nowPlayingController, self.worldPlayingController, self.accountController, nil];
	TwitterUser *twitterUser = [TwitterUser fromDefaults];
	if (!twitterUser)
	{
		self.tabBarController.selectedIndex = 2;
	}
    self.window = appWindow;
	[self.window addSubview:self.tabBarController.view];	
	[self.window makeKeyAndVisible];	

    [appWindow release];
	
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
