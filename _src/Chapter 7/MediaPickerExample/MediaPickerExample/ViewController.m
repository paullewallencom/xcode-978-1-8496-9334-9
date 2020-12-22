//
//  ViewController.m
//  MediaPickerExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize btnBrowse;
@synthesize imagePicker;
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark called when the user presses the Organize button
- (IBAction)btnBrowse:(id)sender {
    
    // Create image picker controller
    imagePicker = [[UIImagePickerController alloc] init];
    
    // Checks the device to make sure that the Photo Library is available.
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
		// Set source to the Photo Library
		self.imagePicker.delegate = self;
		self.imagePicker.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
		self.imagePicker.mediaTypes =[UIImagePickerController availableMediaTypesForSourceType:self.imagePicker.sourceType];
		self.imagePicker.allowsEditing = NO;
		[self presentViewController:imagePicker animated:YES completion:nil];
    }
    else {
        NSLog(@"Unable to access the Photo Library.");
    }
}

#pragma mark - Image Picker Delegate Methods
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Method is called when the user has chosen an item from the image picker.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    // Determine the media type of the chosen item from the image picker.
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    // Determine if we have chosen a image file from library.
    if ([ mediaType isEqualToString:@"public.image"] ) {
        UIImage *photoImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        self.imageView.image = photoImage;
		self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
	else if ([ mediaType isEqualToString:@"public.movie" ])
	{
		NSURL *movieURL = [info valueForKey:UIImagePickerControllerMediaURL];
		NSLog(@"Movie URL: %@", movieURL);
	}
    
    // Dismiss the imagePicker Dialog
	[picker dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
