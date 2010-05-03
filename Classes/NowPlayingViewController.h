//
//  NowPlayingViewController.h
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "CheckinDetailsViewController.h"
#import "TwitterUser.h"
#import "SongInfo.h"

@interface NowPlayingViewController : UIViewController <UIAlertViewDelegate>{
	UILabel *artistLabel;
	UILabel *titleLabel;
	UIImageView *albumArt;
	SongInfo *songinfo;
	MPMusicPlayerController *musicPlayer;
	MPMediaItem *mediaItem;
	UIButton *checkinButton;
}

@property (readwrite, nonatomic, retain) SongInfo *songinfo;
@property (readwrite, nonatomic, retain) MPMusicPlayerController *musicPlayer;
@property (readwrite, nonatomic, retain) MPMediaItem *mediaItem;

@property (readwrite, nonatomic, retain) IBOutlet UIButton *checkinButton;
@property (readwrite, nonatomic, retain) IBOutlet UILabel *artistLabel;
@property (readwrite, nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (readwrite, nonatomic, retain) IBOutlet UIImageView *albumArt;

- (IBAction) handleCheckinButton:(id)sender;

@end
