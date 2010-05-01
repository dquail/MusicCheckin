//
//  CheckinDetailsViewController.h
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongInfo.h"

@interface CheckinDetailsViewController : UIViewController {
	SongInfo *songInfo;
}

@property (nonatomic, retain) SongInfo *songinfo;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil songinfo:(SongInfo *) songinfo;

@end
