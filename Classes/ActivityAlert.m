//
//  ActivityAlert.m


#import "ActivityAlert.h"


@implementation ActivityAlert

- (id) init 
{
	return [self initWithStatus: @""];
}

- (id) initWithStatus: (NSString *)initStatus
{
	if (self = [super init]) {
		alert = [[UIAlertView alloc] initWithTitle:nil message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];	
		
		statusLabel = [[UILabel alloc] init];
		statusLabel.text = initStatus;
		statusLabel.textColor = [UIColor whiteColor];
		statusLabel.backgroundColor = [UIColor clearColor];
		statusLabel.numberOfLines = 0;
		
		[alert addSubview: statusLabel];
		
		activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhite];
		[alert addSubview: activityView];
	}
	
	return self;
}

- (NSString *) statusText
{
	return statusLabel.text;
}

- (void) setStatusText: (NSString *) status 
{
	statusLabel.text = status;
}

- (void) show 
{
	[alert show];
}

- (void) hide 
{
	[alert dismissWithClickedButtonIndex: 0 animated: YES];
	[activityView stopAnimating];
}


- (void)willPresentAlertView:(UIAlertView *)alertView
{
	//
	// layout here because we don't know the size until the view is shown
	//
	CGRect totalRect = CGRectInset(alert.bounds, 20, 10);
	
	//
	// fudge the size since the alert view is slightly taller than the visible boundaries
	//
//	totalRect.size.width -= 10;
	totalRect.size.height -= 10;
	
	CGRect activityRect = activityView.frame;
	
	activityRect.origin.x = totalRect.origin.x;
	activityRect.origin.y = totalRect.origin.y + (totalRect.size.height - activityRect.size.height) / 2;
	
	[activityView setFrame:activityRect];

	CGRect labelRect = totalRect;
	labelRect.origin.x = activityRect.origin.x + activityRect.size.width + 10;
	labelRect.size.width -= labelRect.origin.x;
	
	[statusLabel setFrame: labelRect];
	
	[activityView startAnimating];
}

- (void) dealloc 
{
	[alert release];
	[statusLabel release];
	[activityView release];
	
	[super dealloc];
}

@end
