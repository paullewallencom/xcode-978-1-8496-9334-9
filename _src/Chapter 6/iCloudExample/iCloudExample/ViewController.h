//
//  ViewController.h
//  iCloudExample
//
//  Created by Steven F Daniel on 8/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Snippet.h"

@interface ViewController : UIViewController

// Declare the Getters and Setters for each of our objects.
@property (weak,   nonatomic) IBOutlet UIBarButtonItem *btnSave;
@property (weak,   nonatomic) IBOutlet UIBarButtonItem *btnLoad;
@property (weak,   nonatomic) IBOutlet UITextView      *docContents;

@property (strong, nonatomic) Snippet                  *document;
@property (strong, nonatomic) NSMetadataQuery          *docQuery;

@end
