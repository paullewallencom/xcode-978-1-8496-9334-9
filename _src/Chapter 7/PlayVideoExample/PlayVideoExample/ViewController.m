//
//  ViewController.m
//  PlayVideoExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize btnPlayVideo;
@synthesize moviePlayerController;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark Handle Playback of the video when the button is pressed.
- (IBAction)btnPlayVideo:(id)sender
{
	// Initialise our moviePlayer Controller with the video path
	NSString *moviePath = [[NSBundle mainBundle]pathForResource:@"GenieCompanyVideo" ofType:@"mp4"];
	NSURL  *movieURL = [NSURL fileURLWithPath:moviePath isDirectory:NO];
	self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
	
	// Set up our notifications to determine when the movie completes
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(moviePlaybackComplete:)
												 name:MPMoviePlayerPlaybackDidFinishNotification
											   object:self.moviePlayerController];
	
	// Add the movie player controller to the view and determine if AirPlay is available
	[self.view addSubview:self.moviePlayerController.view];
	if ([self.moviePlayerController respondsToSelector:@selector(setAllowsAirPlay:)]){
	    [self.moviePlayerController setAllowsAirPlay:YES];
	}
	
	// Initialise the movie player properties and play the video.
	self.moviePlayerController.fullscreen = YES;
	self.moviePlayerController.scalingMode = MPMovieScalingModeAspectFit;
    [self.moviePlayerController play];
}

#pragma mark Method to handle once the video has finished playback.
- (void)moviePlaybackComplete:(NSNotification *)notification
{
	self.moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:self.moviePlayerController];
    [self.moviePlayerController.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
