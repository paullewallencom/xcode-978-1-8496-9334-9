//
//  ViewController.h
//  PlayVideoExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController

// Declare the Getters and Setters for each of our objects.
@property (weak, nonatomic)   IBOutlet UIButton       *btnPlayVideo;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayerController;

// Declare each of our Class methods
- (IBAction)btnPlayVideo:(id)sender;

@end
