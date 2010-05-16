//
//  AccountViewController.m
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountViewController.h"


@implementation AccountViewController

@synthesize twitterPassword, twitterUsername, alert;

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
	twitterPassword.secureTextEntry = YES;
	TwitterUser *currentUser = [TwitterUser fromDefaults];
	if (currentUser)
	{
		self.twitterPassword.text = currentUser.password;
		self.twitterUsername.text = currentUser.username;
	}
	else {
		UIAlertView *welcomeView = [[[UIAlertView alloc] initWithTitle: @"Welcome" message:@"Welcome to Playitlouder.  We need to add your twitter account so we can tweet what your listening.  We're not evil and won't do anything mean." 
															  delegate: self cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];	
		[welcomeView show];
	}

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
	[twitterUsername release];
	[twitterPassword release];
	[alert release];	
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
	self.alert = [[ActivityAlert alloc] initWithStatus: @"Verifying Account ..."];
	[self.alert show];
	TwitterUser *twitter = [[TwitterUser alloc] initWithUsername:self.twitterUsername.text password:self.twitterPassword.text];
	[self.alert hide];
	self.alert = nil;
	NSLog(@"Twitter User: %@", twitter.username);
	if ([twitter validateUser])
	{
		[twitter savetoDefaults];
		UIAlertView *welcomeView = [[[UIAlertView alloc] initWithTitle: @"Registration Succeeded" message:@"You've successfully added your twitter account.  You'll now be able to easily let the world know what you're listening to." 
															  delegate: self cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];	
		self.tabBarController.selectedIndex = 0;
		[welcomeView show];
	}
	else {
		UIAlertView *welcomeView = [[[UIAlertView alloc] initWithTitle: @"Registration Failed" message:@"There was an error registering your twitter account.  Please check your password and try again." 
															  delegate: self cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];	
		[welcomeView show];
	}

}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
	for (UIView* view in self.view.subviews) {
		if ([view isKindOfClass:[UITextField class]])
			[view resignFirstResponder];
	}
}

-(void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	[self dismissModalViewControllerAnimated:YES];	
}

@end
