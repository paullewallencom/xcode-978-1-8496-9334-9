//
//  ViewController.m
//  TwitterExample
//
//  Created by Steven F Daniel on 21/09/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"
#import <social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)composeTweet:(UIButton *)sender
{
	// Attach an image to our Tweet message
	if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
	{
		// Device is able to send a Twitter message
		SLComposeViewController *composeController = [SLComposeViewController
													  composeViewControllerForServiceType:SLServiceTypeTwitter];
		
		SLComposeViewControllerCompletionHandler __block myHandler = ^(SLComposeViewControllerResult result) {
			if (result == SLComposeViewControllerResultDone) {
				UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Twitter"
																	message:@"You tweet was posted successfully."
																   delegate:self
														  cancelButtonTitle:@"OK"
														  otherButtonTitles:nil];
				[alertView show];
			}
			else if (result == SLComposeViewControllerResultCancelled) {
				UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Twitter"
																	message:@"Your tweet was not posted."
																   delegate:self
														  cancelButtonTitle:@"OK"
														  otherButtonTitles:nil];
				[alertView show];
			}
			[composeController dismissViewControllerAnimated:YES completion:nil];
		};
		
		[composeController setCompletionHandler:myHandler];
		
		[composeController setInitialText:@"My first Twitter Post from iOS 6"];
		[composeController addImage:[UIImage imageNamed:@"Blue-Aqua-Apple.png"]];
		[composeController addURL: [NSURL URLWithString:
									@"http://www.packtpub.com/xcode-4-cookbook/book"]];
		
		[self presentViewController:composeController
						   animated:YES completion:nil];
		
	}
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// Ensure we are processing the correct segue within the Storyboard
	if ([segue.identifier isEqualToString:@"secondViewController"])
	{
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Twitter Example"
															message:@"Currently displaying View #2"
														   delegate:self
												  cancelButtonTitle:@"OK"
												  otherButtonTitles:nil];
		[alertView show];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
