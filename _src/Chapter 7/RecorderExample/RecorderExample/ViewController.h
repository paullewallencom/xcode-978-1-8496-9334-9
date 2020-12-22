//
//  ViewController.h
//  RecorderExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

// Declare the getters and setters for our Outlets
@property (nonatomic, strong) IBOutlet UIBarButtonItem *btnStart;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *btnPlay;

@property (nonatomic, strong)          AVAudioRecorder *aRecorder;
@property (nonatomic, strong)          AVAudioPlayer   *aPlayer;

// Declare our class instance methods
- (IBAction)startRecord:(id)sender;
- (IBAction)startPlayback:(id)sender;

@end