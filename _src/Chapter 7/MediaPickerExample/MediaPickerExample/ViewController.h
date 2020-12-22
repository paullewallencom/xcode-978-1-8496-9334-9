//
//  ViewController.h
//  MediaPickerExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

// Declare the Getters and Setters for each of our objects.
@property (weak, nonatomic)   IBOutlet UIBarButtonItem         *btnBrowse;
@property (weak, nonatomic)   IBOutlet UIImageView             *imageView;
@property (nonatomic, retain)          UIImagePickerController *imagePicker;

// Declare each of our Class methods
- (IBAction)btnBrowse:(id)sender;

@end
