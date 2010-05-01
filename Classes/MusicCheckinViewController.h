//
//  MusicCheckinViewController.h
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NowPlayingViewController.h"

@interface MusicCheckinViewController : UIViewController {
	UITextField *twitterUsername;
	UITextField *twitterPassword;
}
@property (readwrite, nonatomic, retain) IBOutlet UITextField *twitterUsername;
@property (readwrite, nonatomic, retain) IBOutlet UITextField *twitterPassword;

- (IBAction) handleAddButton:(id)sender;
@end

