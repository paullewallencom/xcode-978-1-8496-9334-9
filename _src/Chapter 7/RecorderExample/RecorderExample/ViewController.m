//
//  ViewController.m
//  RecorderExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize btnStart, btnPlay;
@synthesize aPlayer, aRecorder;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Initialize our recording sample file properties.
	NSString *fileName = @"RecorderExample.caf";
	NSArray  *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
												   NSUserDomainMask, YES);
	NSString *docsDir = [dirPaths objectAtIndex:0];
	NSString *soundFilePath = [docsDir stringByAppendingPathComponent:fileName];
	NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
	
	// Initialize the recorder with default settings.
    NSDictionary *recordSettings = [NSDictionary dictionaryWithObjectsAndKeys:
									[NSNumber numberWithInt:AVAudioQualityMin],
									AVEncoderAudioQualityKey,
									[NSNumber numberWithInt:16],
									AVEncoderBitRateKey,
									[NSNumber numberWithInt:2],
									AVNumberOfChannelsKey,
									[NSNumber numberWithFloat:44100.0],
									AVSampleRateKey, nil];
	
	// Initialize our audio Recorder settings and the default recording filename
	aRecorder = [[AVAudioRecorder alloc] initWithURL:soundFileURL
												settings:recordSettings
												   error:nil];
	
	[aRecorder prepareToRecord];
	aRecorder.meteringEnabled = YES;
	btnPlay.enabled = NO;
	
	// Set the background color of our view to black
	self.view.backgroundColor = [UIColor blackColor];
}

#pragma mark Handles recording of the audio
- (IBAction)startRecord:(id)sender
{
    // Check to see if we are already recording.
	if (!aRecorder.recording) {
	    [btnStart setTitle :@"Stop Recording"];
		btnPlay.enabled = NO;
		[aRecorder record];
	}
	else {
		[btnStart setTitle:@"Start Recording"];
		btnPlay.enabled = YES;
		[aRecorder stop];
	}
}

#pragma mark  Handles playback of our recording.
-(IBAction)startPlayback:(id)sender
{
	// Check to see if we are already playing.
	if (!aPlayer.playing) {
        [btnPlay setTitle :@"Stop Playing"];

		// Grab the recorded file from the url location.
		aPlayer = [[AVAudioPlayer alloc]
					   initWithContentsOfURL:aRecorder.url error:nil];
		
	    // Play our audio file
		[aPlayer prepareToPlay];
		[aPlayer play];
	}
	else {
		// Stop the audio playback
		[btnPlay setTitle :@"Play"];
		[aPlayer stop];
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
