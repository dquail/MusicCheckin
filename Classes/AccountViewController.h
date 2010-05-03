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
#import "ActivityAlert.h"

@interface AccountViewController : UIViewController <UIAlertViewDelegate> {
	UITextField *twitterUsername;
	UITextField *twitterPassword;
	ActivityAlert *alert;
}
@property (readwrite, nonatomic, retain) IBOutlet UITextField *twitterUsername;
@property (readwrite, nonatomic, retain) IBOutlet UITextField *twitterPassword;
@property (retain, nonatomic) ActivityAlert *alert;

- (IBAction) handleAddButton:(id)sender;
@end
