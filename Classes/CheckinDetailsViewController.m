//
//  CheckinDetailsViewController.m
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CheckinDetailsViewController.h"


@implementation CheckinDetailsViewController

@synthesize songinfo;
@synthesize checkinTextView;
@synthesize artistInfoLabel;
@synthesize countLabel;
@synthesize locationManager;
@synthesize currentLocation;
@synthesize latitudeString;
@synthesize longitudeString;
@synthesize waitingImage;
@synthesize activityIndicator;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil songinfo: (SongInfo *) info {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		self.songinfo = info;
    }
    return self;
}

//Need to fix this
- (IBAction)checkinButtonPressed:(id)sender {
	TwitterUser *user = [TwitterUser fromDefaults];
	NSString *artist = self.songinfo.artistName;
	NSString *song = self.songinfo.title;
	
	tooLong = NO;
	if ([checkinTextView.text length] > 140) {
		tooLong = YES;
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Your message is too long!" 
														message:@"Messages must be shorter than 140 characters for Twitter." 
													   delegate:self cancelButtonTitle:@"Okay" 
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	
	if (tooLong == NO) {
		ActivityAlert *activityAlert = [[ActivityAlert alloc] initWithStatus: @"Sharing your music ..."] ;
		[activityAlert show];

		NSString *themessage = [NSString stringWithFormat:@"%@ - %@ #playitloudr. %@",
								song, artist, checkinTextView.text];
		NSLog(themessage);
		//TWITTER BLACK MAGIC
		//NSString *url = [NSString stringWithFormat:@"http://camapitest:yycsux@twitter.com/statuses/update.xml"];
		NSString *url = [NSString stringWithFormat:@"http://%@:%@@twitter.com/statuses/update.xml", user.username, user.password];
		NSString *escapedUrl = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; 
		NSLog(@"%@", escapedUrl);
		NSMutableURLRequest *theRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
																cachePolicy:NSURLRequestUseProtocolCachePolicy
															timeoutInterval:60.0];
		[theRequest setHTTPMethod:@"POST"];
		NSString *bodyUnencoded = [NSString stringWithFormat:@"status=%@ &lat=%@ &long=%@", themessage, latitudeString, longitudeString];
		NSString *theRequestBody = [bodyUnencoded stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; 
		[theRequest setHTTPBody:[theRequestBody dataUsingEncoding:NSASCIIStringEncoding]];
		NSLog(@"%@", theRequest);
		NSURLResponse *response;
		NSError *error;
		NSData *result = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&response error:&error];
		NSLog(@"%@", [[[NSString alloc] initWithData:result encoding:NSASCIIStringEncoding] autorelease]);
		[activityAlert hide];
		activityAlert = nil;
		UIAlertView *welcomeView = [[[UIAlertView alloc] initWithTitle: @"You've shared" message:@"You've just shared the music youre playing!" 
															  delegate: self cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];	
		[welcomeView show];
	}
}

- (IBAction)locationButtonPressed:(id)sender {
	self.locationManager = [[[CLLocationManager alloc] init] autorelease];
	self.locationManager.delegate = self; 
	self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	[self.locationManager startUpdatingLocation];
	[self.view bringSubviewToFront:waitingImage];
	waitingImage.hidden = NO;
	[self.view bringSubviewToFront:activityIndicator];
	activityIndicator.hidden = NO;
	[activityIndicator startAnimating];
}

- (IBAction)cancelButtonPressed:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}


-(void)textViewDidChange:(UITextView *)textview {
	int charactersLeft = 140 - [checkinTextView.text length] - 17 - [songinfo.title length] - [songinfo.artistName length];
	countLabel.text = [NSString stringWithFormat:@"%i", charactersLeft];
	if (charactersLeft < 0) {
		countLabel.textColor = [UIColor redColor];
	}
	else {
		countLabel.textColor = [UIColor blackColor];
	}
	
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    // Any new character added is passed in as the "text" parameter
    if ([text isEqualToString:@"\n"]) {
        // Be sure to test for equality using the "isEqualToString" message
        [textView resignFirstResponder];
        // Return FALSE so that the final '\n' character doesn't get added
        return FALSE;
    }
    // For any other character return TRUE so that the text gets added to the view
    return TRUE;
}

- (IBAction)dismissKeyboard:(id)sender {
	[checkinTextView resignFirstResponder];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSString *initialText = [[NSString alloc] initWithFormat:@"%@ - %@", self.songinfo.title, self.songinfo.artistName];
	artistInfoLabel.text = initialText;
	[checkinTextView becomeFirstResponder];
	[initialText release];
	int charactersLeft = 140 - [initialText length] - 17;
	countLabel.text = [NSString stringWithFormat:@"%i", charactersLeft];
	[super viewDidLoad];
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
	self.checkinTextView = nil;
	self.countLabel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[checkinTextView release];
	[countLabel release];
    [super dealloc];
}

#pragma mark -
#pragma mark CLLocationManagerDelegate Methods

- (void)locationManager:(CLLocationManager *)manager 
	didUpdateToLocation:(CLLocation *)newLocation 
		   fromLocation:(CLLocation *)oldLocation { 
	CLLocationDegrees latitude = newLocation.coordinate.latitude; 
	CLLocationDegrees longitude = newLocation.coordinate.longitude;
	self.latitudeString = [NSString stringWithFormat:@"%.4f", latitude];
	self.longitudeString = [NSString stringWithFormat:@"%.4f", longitude];
	NSLog(@"%@", latitudeString);
	NSLog(@"%@", longitudeString);
	[self.locationManager stopUpdatingLocation];
	
	[self.view sendSubviewToBack:waitingImage];
	waitingImage.hidden = YES;
	[self.view sendSubviewToBack:activityIndicator];
	activityIndicator.hidden = YES;
	[activityIndicator stopAnimating];
}

- (void)locationManager:(CLLocationManager *)manager 
       didFailWithError:(NSError *)error {
    
    NSString *errorType = (error.code == kCLErrorDenied) ? 
    @"Access Denied" : @"Unknown Error";
    UIAlertView *alert = [[UIAlertView alloc] 
                          initWithTitle:@"Error getting Location" 
                          message:errorType 
                          delegate:nil 
                          cancelButtonTitle:@"Okay" 
                          otherButtonTitles:nil];
    [alert show];
    [alert release];
    
}
-(void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	[self dismissModalViewControllerAnimated:YES];	
}

@end
