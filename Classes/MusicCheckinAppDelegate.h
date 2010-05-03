//
//  MusicCheckinAppDelegate.h
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterUser.h"
#import "AccountViewController.h"
#import "NowPlayingViewController.h"
#import "WorldPlayingViewController.h"

@interface MusicCheckinAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	UINavigationController *mainNavigation;
	UITabBarController *tabBarController;
	AccountViewController *accountController;
	NowPlayingViewController *nowPlayingController;
	WorldPlayingViewController *worldPlayingController;
}

@property (nonatomic, retain) UITabBarController *tabBarController;
@property (nonatomic, retain) AccountViewController *accountController;
@property (nonatomic, retain) NowPlayingViewController *nowPlayingController;
@property (nonatomic, retain) WorldPlayingViewController *worldPlayingController;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UINavigationController *mainNavigation;

@end

