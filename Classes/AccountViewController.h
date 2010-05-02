//
//  AccountViewController.h
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NowPlayingViewController.h"
#import "TwitterUser.h"

@interface AccountViewController : UIViewController {
	UITextField *twitterUsername;
	UITextField *twitterPassword;
}
@property (readwrite, nonatomic, retain) IBOutlet UITextField *twitterUsername;
@property (readwrite, nonatomic, retain) IBOutlet UITextField *twitterPassword;

- (IBAction) handleAddButton:(id)sender;
@end
