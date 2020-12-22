//
//  ViewController.m
//  CameraPickerExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize btnCamera;
@synthesize imagePicker;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark called when the user presses the camera button
- (IBAction)btnCamera:(id)sender {
    
    // Checks the device to make sure that the Photo Library is available.
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
		// Create image picker controller
		imagePicker = [[UIImagePickerController alloc] init];

        // Set our source to the Camera
		self.imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
		self.imagePicker.delegate = self;
        self.imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        self.imagePicker.allowsEditing = NO;
		[self presentViewController:imagePicker animated:YES completion:nil];
    }
    else {
        NSLog(@"Use of the Camera is not available.");
    }
}

#pragma mark - Image Picker Delegate Methods
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark method is called when the user has chosen an item from the image picker.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
	// Access the uncropped image from info dictionary and Save the image
	UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
	UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    // Then dismiss the imagePicker Dialog
	[picker dismissViewControllerAnimated:NO completion:nil];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
	// Handle any errors detected during the save
	if (error) {
		NSLog(@"Unable to save the image to the Photo Album");
	}
	else {
		NSLog(@"Image successfully saved to the Photo Album");
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
