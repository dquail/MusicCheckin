//
//  SongInfo.m
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SongInfo.h"


@implementation SongInfo

@synthesize title, album, albumArt, artistName;

- (void) dealloc
{
	[title release];
	[album release];
	[artistName release];
	[albumArt release];	
	[super dealloc];
}
@end
