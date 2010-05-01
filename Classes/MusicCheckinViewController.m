//
//  MusicCheckinViewController.m
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MusicCheckinViewController.h"

@implementation MusicCheckinViewController

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

	NowPlayingViewController *nowPlaying = [[NowPlayingViewController alloc] initWithNibName:nil bundle:nil];
		UINavigationController *mainNav = [[UINavigationController alloc]initWithRootViewController:nowPlaying];
	[self presentModalViewController:nowPlaying animated:YES];
	NSLog(@"Now playing clicked");

}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
	for (UIView* view in self.view.subviews) {
		if ([view isKindOfClass:[UITextField class]])
			[view resignFirstResponder];
	}
}

@end
