//
//  NowPlayingViewController.h
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckinDetailsViewController.h"

@interface NowPlayingViewController : UIViewController {
	UILabel *artist;
	UILabel *song;
	UILabel *albumArt;
	SongInfo *songinfo;
}

@property (readwrite, nonatomic, retain) SongInfo *songinfo;

- (IBAction) handleCheckinButton:(id)sender;

@end
