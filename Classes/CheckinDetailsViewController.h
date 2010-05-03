//
//  CheckinDetailsViewController.h
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongInfo.h"
#import <CoreLocation/CoreLocation.h>
#import "TwitterUser.h"
#import <MediaPlayer/MediaPlayer.h>
#import "ActivityAlert.h"

@interface CheckinDetailsViewController : UIViewController <CLLocationManagerDelegate, UIAlertViewDelegate> {
	SongInfo *songinfo;
	UITextView *checkinTextView;
	UILabel *artistInfoLabel;
	UILabel *countLabel;
	BOOL tooLong;
	//Location stuff
	CLLocationManager *locationManager;
	CLLocation *currentLocation;
	NSString *latitudeString;
	NSString *longitudeString;
	UIImageView *waitingImage;
	UIActivityIndicatorView *activityIndicator;
	
}

@property (readwrite, nonatomic, retain) SongInfo *songinfo;
@property (nonatomic, retain) IBOutlet UITextView *checkinTextView;
@property (nonatomic, retain) IBOutlet UILabel *artistInfoLabel;
@property (nonatomic, retain) IBOutlet UILabel *countLabel;

//Location Stuff
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) CLLocation *currentLocation;
@property (nonatomic, retain) NSString *latitudeString;
@property (nonatomic, retain) NSString *longitudeString;

@property (nonatomic, retain) IBOutlet UIImageView *waitingImage;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil songinfo:(SongInfo *) info;

- (IBAction)checkinButtonPressed:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)locationButtonPressed:(id)sender;

@end
