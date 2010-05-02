//
//  AccountViewController.m
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountViewController.h"


@implementation AccountViewController

@synthesize twitterPassword, twitterUsername;

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationController.navigationBarHidden = YES;
	[twitterUsername becomeFirstResponder];
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


/*
 Handling add account*/
-(void) handleAddButton:(id)sender
{
	NSLog(@"Username - %@", twitterUsername.text);
	NSLog(@"Password - %@", twitterPassword.text);
	[twitterUsername resignFirstResponder];
	[twitterPassword resignFirstResponder];
	//TODO: Add code to verify and cache twitter creds
	/*TwitterUser *twitter = [[TwitterUser alloc] init];
	 twitter.username = self.twitterUsername.text;
	 twitter.password = self.twitterPassword.text;*/
	TwitterUser *twitter = [[TwitterUser alloc] initWithUsername:self.twitterUsername.text password:self.twitterPassword.text];
	NSLog(@"Twitter User: %@", twitter.username);
	[twitter savetoDefaults];
	NSLog(@"Twitter name %@ password %@", twitter.username, twitter.password);
	
	NowPlayingViewController *nowPlaying = [[NowPlayingViewController alloc] initWithNibName:nil bundle:nil];
	self.navigationController.navigationBarHidden = NO;
	nowPlaying.title = @"Now Playing";

	[self.navigationController pushViewController:nowPlaying animated:YES];
	[nowPlaying release];
	//[self presentModalViewController: mainNav.topViewController animated:YES];
	NSLog(@"Now playing clicked");
	
}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
	for (UIView* view in self.view.subviews) {
		if ([view isKindOfClass:[UITextField class]])
			[view resignFirstResponder];
	}
}

@end
