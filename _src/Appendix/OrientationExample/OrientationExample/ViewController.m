//
//  ViewController.m
//  OrientationExample
//
//  Created by Steven F Daniel on 19/09/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Do any additional setup after loading the view, typically from a nib.
	[[UIDevice currentDevice]beginGeneratingDeviceOrientationNotifications];
	[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hasOrientationChanged:) name:@"UIDeviceOrientationDidChangeNotification" object:nil];
}

-(void)hasOrientationChanged:(NSNotification *)notification {
	UIDeviceOrientation currentOrientation;
	currentOrientation = [[UIDevice currentDevice] orientation];
	
	switch (currentOrientation) {
		case UIDeviceOrientationFaceUp:
			self.view.backgroundColor = [UIColor brownColor];
			break;
		case UIDeviceOrientationFaceDown:
			self.view.backgroundColor = [UIColor magentaColor];
			break;
		case UIDeviceOrientationPortrait:
			self.view.backgroundColor = [UIColor blueColor];
			break;
		case UIDeviceOrientationPortraitUpsideDown:
			self.view.backgroundColor = [UIColor blueColor];
			break;
		case UIDeviceOrientationLandscapeLeft:
			self.view.backgroundColor = [UIColor greenColor];
			break;
		case UIDeviceOrientationLandscapeRight:
			self.view.backgroundColor = [UIColor redColor];
			break;
		default:
			self.view.backgroundColor = [UIColor blackColor];
			break;
	}
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
