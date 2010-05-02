//
//  NowPlayingViewController.m
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NowPlayingViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation NowPlayingViewController

@synthesize songinfo;
@synthesize musicPlayer;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		self.musicPlayer = [MPMusicPlayerController iPodMusicPlayer];
    }
    return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];

	MPMediaItem *currentItem = self.musicPlayer.nowPlayingItem;

	self.songinfo = [[SongInfo alloc] init];
	self.songinfo.title = [currentItem valueForProperty:MPMediaItemPropertyTitle];
	self.songinfo.album = [currentItem valueForProperty:MPMediaItemPropertyAlbumTitle];

	self.title = @"Now Playing";
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (IBAction) handleCheckinButton:(id)sender{
	//CheckinDetailsViewController *checkInDetails = [[CheckinDetailsViewController alloc] initWithNibName:nil bundle:nil];
	
	//Testing the nsdefaults
	//TwitterUser *tUser = [TwitterUser fromDefaults];
	//NSLog(@"Returned user from defaults %@", tUser.username);
	CheckinDetailsViewController *checkInDetails = [[CheckinDetailsViewController alloc] initWithNibName:nil bundle:nil songinfo:self.songinfo];
	[self.navigationController pushViewController:checkInDetails animated:YES];	
}


@end
