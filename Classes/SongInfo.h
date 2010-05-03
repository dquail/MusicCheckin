//
//  SongInfo.h
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SongInfo : NSObject {
	NSString *title;
	NSString *album;
	NSString *artistName;
	UIImage *albumArt;
}
@property (nonatomic, retain) UIImage *albumArt;
@property (nonatomic, retain) NSString *album;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *artistName;
@end
