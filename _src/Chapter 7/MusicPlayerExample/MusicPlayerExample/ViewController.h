//
//  ViewController.h
//  MusicPlayerExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController<MPMediaPickerControllerDelegate>


// =======================================================================
// Declare the Getters and Setters for each of our objects.
// =======================================================================
@property (weak, nonatomic)   IBOutlet UIBarButtonItem         *btnBrowse;
@property (weak, nonatomic)   IBOutlet UIBarButtonItem         *btnPlay;

@property (nonatomic, retain)          MPMusicPlayerController *mPlayer;
@property (nonatomic, retain)          MPMediaPickerController *mPicker;


// =======================================================================
// Declare each of our Class Instance Methods
// =======================================================================
- (IBAction)btnBrowse:(id)sender;
- (IBAction)btnPlay:(id)sender;

@end
