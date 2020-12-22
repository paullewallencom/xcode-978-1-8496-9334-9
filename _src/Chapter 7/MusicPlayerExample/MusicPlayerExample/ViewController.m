//
//  ViewController.m
//  MusicPlayerExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize btnBrowse;
@synthesize btnPlay;
@synthesize mPicker;
@synthesize mPlayer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Create the Media Picker and Music Player controller's
    self.mPicker = [[MPMediaPickerController alloc] initWithMediaTypes: MPMediaTypeMusic];
	self.mPlayer = [[MPMusicPlayerController alloc] init];
	
	[mPlayer prepareToPlay];	
	
	// Set the background color of our view to black
	self.view.backgroundColor = [UIColor blackColor];
}

#pragma mark called when the user presses the Photo Library button
- (IBAction)btnBrowse:(id)sender {
    
    // Create image picker controller
	self.mPicker.delegate = self;
	self.mPicker.allowsPickingMultipleItems = YES;
	[self presentViewController:mPicker animated:YES completion:nil];
}

-(IBAction)btnPlay:(id)sender {
	// Check to see if we are already playing our audio.
	if (!self.mPlayer.playbackState == MPMusicPlaybackStatePlaying) {
	    [self.btnPlay setTitle :@"Stop"];
		[self.mPlayer play];
	}
	else {
		[self.btnPlay setTitle:@"Play"];
		[self.mPlayer stop];
	}
}

#pragma mark - Image Picker Delegate Methods
- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {
	[self.mPlayer setQueueWithItemCollection:mediaItemCollection];
    [self.mPicker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark called when the user cancels the media picker
-(void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker {
    [self.mPicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
