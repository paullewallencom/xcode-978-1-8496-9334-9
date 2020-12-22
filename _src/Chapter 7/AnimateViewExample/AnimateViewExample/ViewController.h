//
//  ViewController.h
//  AnimateViewExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
	__weak IBOutlet UILabel *lblAnimateMsg;
	__weak IBOutlet UIButton *btnAnimate;
}

// Create our properties: Getters and Setters
@property (weak, nonatomic) IBOutlet UILabel *lblAnimateMsg;
@property (weak, nonatomic) IBOutlet UIButton *btnAnimate;

// Create our class instance methods
- (IBAction)doAnimation:(id)sender;

@end
