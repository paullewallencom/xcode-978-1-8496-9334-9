//
//  ViewController.h
//  CameraPickerExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
	__weak   IBOutlet UIBarButtonItem *btnCamera;
}

// Declare the Getters and Setters for each of our objects.
@property (weak, nonatomic)   IBOutlet UIBarButtonItem         *btnCamera;
@property (nonatomic, retain)          UIImagePickerController *imagePicker;

// Declare each of our Class methods
- (IBAction)btnCamera:(id)sender;

@end
