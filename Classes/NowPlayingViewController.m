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

@synthesize songinfo, musicPlayer, mediaItem, artistLabel, titleLabel, albumArt, checkinButton;

- (void) updateSongUIWithMediaItem
{
	if (self.mediaItem)
	{
		self.checkinButton.enabled = YES;
		self.songinfo.title = [self.mediaItem valueForProperty:MPMediaItemPropertyTitle];
		self.songinfo.artistName = [self.mediaItem valueForProperty:MPMediaItemPropertyArtist];  
		self.titleLabel.text = [self.mediaItem valueForProperty:MPMediaItemPropertyTitle];
		self.artistLabel.text = [self.mediaItem valueForProperty:MPMediaItemPropertyArtist]; 
		// Display album artwork. self.artworkImageView is a UIImageView.
		CGSize artworkImageViewSize = self.albumArt.bounds.size;
		MPMediaItemArtwork *artwork = [self.mediaItem valueForProperty:MPMediaItemPropertyArtwork];
		if (artwork != nil) {
			self.albumArt.image = [artwork imageWithSize:artworkImageViewSize];
		} else {
			self.albumArt.image = nil;
		}	
	}
	else {
		
		UIAlertView *welcomeView = [[[UIAlertView alloc] initWithTitle: @"Nothing playing" message:@"There's no music currently playing for you to share with the world." 
															  delegate: self cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];	
		self.checkinButton.enabled = NO;
		self.artistLabel.text = @"No music Playing";
		self.titleLabel.text = @"";
		self.albumArt.image = nil;
		[welcomeView show];
	}

}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		self.songinfo = [[SongInfo alloc] init];
		self.musicPlayer = [MPMusicPlayerController iPodMusicPlayer];
		self.navigationController.navigationBarHidden = YES;
		TwitterUser *twitterUser = [TwitterUser fromDefaults];
		if (!twitterUser)
		{
			UIAlertView *welcomeView = [[[UIAlertView alloc] initWithTitle: @"No twitter user" message:@"You have to configure your twitter account before you start sharing what you're listening to." 
																  delegate: self cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];	
			[welcomeView show];

		}		
    }
    return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];

	self.mediaItem = self.musicPlayer.nowPlayingItem;
	self.songinfo.title = [self.mediaItem valueForProperty:MPMediaItemPropertyTitle];
	self.songinfo.artistName = [self.mediaItem valueForProperty:MPMediaItemPropertyArtist];  
	[self updateSongUIWithMediaItem];
	// Register for music player notifications
	NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
	[notificationCenter addObserver:self 
						   selector:@selector(handleNowPlayingItemChanged:)
							   name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification 
							 object:self.musicPlayer];
	[self.musicPlayer beginGeneratingPlaybackNotifications];	
	
	self.navigationController.navigationBarHidden = TRUE;
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
	[artistLabel release];
	[titleLabel release];
	[albumArt release];
	[songinfo release];
	[musicPlayer release];
	[mediaItem release];
	[checkinButton release];	
    [super dealloc];
}

- (IBAction) handleCheckinButton:(id)sender{
	TwitterUser *twitterUser = [TwitterUser fromDefaults];
	if (!twitterUser)
	{
		UIAlertView *welcomeView = [[[UIAlertView alloc] initWithTitle: @"No twitter user" message:@"You have to configure your twitter account before you start sharing what you're listening to." 
														  delegate: self cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];	
		[welcomeView show];	
	}
	else {
		CheckinDetailsViewController *checkInDetails = [[CheckinDetailsViewController alloc] initWithNibName:nil bundle:nil songinfo:self.songinfo];
		[self presentModalViewController:checkInDetails animated:YES];
	}

	
}

// When the now playing item changes, update song info labels and artwork display.
- (void)handleNowPlayingItemChanged:(id)notification {
    // Ask the music player for the current song.
   self.mediaItem = self.musicPlayer.nowPlayingItem;
	[self updateSongUIWithMediaItem];
}

-(void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	[self dismissModalViewControllerAnimated:YES];	
}

@end
