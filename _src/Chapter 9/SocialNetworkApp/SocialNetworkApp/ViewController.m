//
//  ViewController.m
//  SocialNetworkApp
//
//  Created by Steven F. Daniel on 11/12/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"
#import "FBConnect.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize mainDelegate, loginButton, postMessage, imgPhoto, userInfoDetails, facebook;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set up our delegate object
    self.mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.facebook = mainDelegate.facebook;
    
    // Initialize our form fields
    userInfoDetails.text = @"";
}

#pragma mark Called when the user presses the Post Message Button
- (IBAction)postMessage:(id)sender {
	
    // Define an instance of our action sheet
    UIActionSheet *actionSheet;
    
    // Initialize our action sheet with the different mapping types
    actionSheet = [[UIActionSheet alloc]initWithTitle:@"Choose from the list below"
                                             delegate:self
                                    cancelButtonTitle:@"Cancel"
                               destructiveButtonTitle:@"Close"
                                    otherButtonTitles:@"Send Notification",@"Submit new post",
				   @"Obtain User Details",nil];
    
    // Set our Action Sheet style and then display it to the user
    actionSheet.actionSheetStyle =  UIBarStyleBlackTranslucent;
    [actionSheet showInView:self.view];
}

#pragma mark Delegate that handles the chosen action sheet options
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // Determine the chosen item
    switch (buttonIndex) {
        case 1:  [self sendNotificationRequest]; break;
        case 2:  [self postMessagetoWall];       break;
        case 3:  [self getGraphAPIData];         break;
        default: break;  // Catch the Close button and exit.
    }
}

#pragma mark
#pragma mark - Facebook Method

#pragma mark Method to send a notification request to a group of friends.
- (void)sendNotificationRequest
{
    NSMutableDictionary *params =
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"invites you to check out some great stuff.", @"message",
     @"Check this out", @"notification_text",
     nil];
    
    // Display the Facebook Request Notifications DialogBox
    [self.facebook dialog:@"apprequests" andParams:params andDelegate:self.mainDelegate];
}

#pragma mark FBDialogDelegate
- (void)dialogDidComplete:(FBDialog *)dialog {
    NSLog(@"dialog completed successfully");
}

#pragma mark Method to post a message to the current user's Wall.
- (void)postMessagetoWall
{
    NSMutableDictionary *params =
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"Testing FacebookSampleApp Feed Dialog", @"name",
     @"Using Feed Dialogs within iOS are great.", @"caption",
     @"Click to check out my BlockHeadz game on the AppStore", @"description",
     @"http://itunes.apple.com/app/block-headz/id386884355?mt=8#", @"link",
     @"http://geniesoftstudios.com/blog/wp-content/uploads/2011/03/blockhead.png", @"picture",
     nil];
    
    // Display the Facebook feed dialog with our array.
    [self.facebook dialog:@"feed" andParams:params andDelegate:self.mainDelegate];
}

#pragma mark Handle when the login button is pressed.
- (IBAction)loginButton:(id)sender
{
	if ([loginButton.title isEqualToString:@"Sign In"]) {
		if (![self.facebook isSessionValid]) {
			NSLog(@"facebook session");
			NSArray *permissions = [[NSArray alloc] initWithObjects:@"email",@"publish_actions", nil];
			[self.facebook authorize:permissions];
			[permissions release];
		}
		else {
			NSLog(@"session still valid");
		}
		[loginButton setTitle:@"Sign Out"];
	}
	else if ([loginButton.title isEqualToString:@"Sign Out"]) {
		[loginButton setTitle:@"Sign In"];
		[self.facebook logout:self.mainDelegate];
	}
}

#pragma mark - Facebook GraphAPI Method
-(void)getGraphAPIData
{
    // Make a call using the Facebook Query Language to get the current user details.
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"SELECT quotes, uid, name, pic FROM user WHERE uid=me()", @"query",
                                   nil];
    
    [self.facebook requestWithMethodName:@"fql.query"
							   andParams:params
						   andHttpMethod:@"POST"
							 andDelegate:self];
}

#pragma mark This method gets called when the Graph API call has completed
-(void)request:(FBRequest *)request didLoad:(id)result
{
    if ([result isKindOfClass:[NSArray class]]) {
        result = [result objectAtIndex:0];
    }
	
    // This callback can be a result of getting the user's basic
    // information or getting the user's permissions.
    if ([result objectForKey:@"name"]) {
        // Retrieve back the basic user information.
        NSString *concatString = [[NSString alloc] initWithFormat:@"ID: %@\nName: %@\nQuotes: %@\n", [result objectForKey:@"uid"]
								  ,[result objectForKey:@"name"], [result objectForKey:@"quotes"]];
        
        // Get the profile image
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[result objectForKey:@"pic"]]]];
        self.imgPhoto.image = image;
        self.userInfoDetails.text = concatString;
    }
}

#pragma mark This method is called when an error has occurred while retrieving GraphAPI details.
-(void)request:(FBRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"An error occurred obtaining details: %@",error);
}

- (void)dealloc {
    [loginButton release];
    [postMessage release];
    [imgPhoto release];
    [userInfoDetails release];
    [super dealloc];
}
@end