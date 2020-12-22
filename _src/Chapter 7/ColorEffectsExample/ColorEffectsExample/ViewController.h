//
//  ViewController.h
//  ColorEffectsExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IMAGENAME @"Frederick_Prince_of_Wales.jpg"

@interface ViewController : UIViewController<UIActionSheetDelegate>

// Declare the Getters and Setters for each of our objects.
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
