//
//  ViewController.h
//  UniversalApp
//
//  Created by Steven F Daniel on 19/09/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
	__weak IBOutlet UILabel *lblMessage;
}

@property (weak, nonatomic) IBOutlet UILabel *lblMessage;

@end
