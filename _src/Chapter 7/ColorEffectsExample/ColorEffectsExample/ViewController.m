//
//  ViewController.m
//  ColorEffectsExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Set up and initialize our ImageView Controller.
	self.imageView.image = [UIImage imageNamed:IMAGENAME];
	self.imageView.contentMode = UIViewContentModeScaleAspectFill;
}

#pragma mark method called when the user taps the screen
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	// Initialise our Action Sheet with options
	UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Available Transitions"
															delegate:self
												   cancelButtonTitle:@"Cancel"
											  destructiveButtonTitle:@"Close"
												   otherButtonTitles:@"Vibrance",@"Sepia Tone",@"Reset Image", nil];
	
    // Display the actionsheet to the view.
    [actionSheet showInView:self.view];
	
}
#pragma mark Delegate which handles the processing of the option buttons selected
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	CIImage   *inputImage = [CIImage imageWithCGImage:[self.imageView.image CGImage]];
	CIContext *context = [CIContext contextWithOptions:nil];
	CIImage   *outputImage;
	CIFilter  *filter;
	
	// Changes the overall hue, or tint, of the source pixels.
	switch (buttonIndex)
	{
		case 1: // Adjusts the saturation of an image while keeping pleasing skin tones.
			filter = [CIFilter filterWithName:@"CIVibrance"];
			[filter setDefaults];
			[filter setValue: inputImage forKey: @"inputImage"];
			[filter setValue: [NSNumber numberWithFloat: 1.00] forKey: @"inputAmount"];
			outputImage = [filter valueForKey: @"outputImage"];
			break;
		case 2:	// Set the Septia Tone on the image
			filter = [CIFilter filterWithName:@"CISepiaTone"];
			[filter setDefaults];
			[filter setValue: inputImage forKey:@"inputImage"];
			[filter setValue: [NSNumber numberWithFloat: 0.8] forKey: @"inputIntensity"];
			outputImage = [filter valueForKey:@"outputImage"];
			break;
		case 3: // Reset our image to the original state
			self.imageView.image = [UIImage imageNamed:IMAGENAME];
			break;
		default:
			NSLog(@"Unsupported option detected.");
			break;
	}
	// Don't process if the Close and Cancel buttons are pressed
	if (buttonIndex > 0 && buttonIndex < 3) {
		self.imageView.image = [UIImage imageWithCGImage:
								[context createCGImage:outputImage
											  fromRect:outputImage.extent]];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
