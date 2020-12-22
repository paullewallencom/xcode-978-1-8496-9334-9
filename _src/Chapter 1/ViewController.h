//
//  ViewController.h
//  HelloWorld
//
//  Created by Steven F Daniel on 22/08/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *lblFirstname;
    IBOutlet UITextField *txtFirstname;
    IBOutlet UILabel *lblSurname;
    IBOutlet UITextField *txtSurname;
    IBOutlet UILabel *lblOutput;
    IBOutlet UIButton *btnTapHere;
}

@property (strong, nonatomic) IBOutlet UILabel *lblFirstname;
@property (strong, nonatomic) IBOutlet UITextField *txtFirstname;
@property (strong, nonatomic) IBOutlet UILabel *lblSurname;
@property (strong, nonatomic) IBOutlet UITextField *txtSurname;
@property (strong, nonatomic) IBOutlet UILabel *lblOutput;
@property (strong, nonatomic) IBOutlet UIButton *btnTapHere;

- (IBAction)btnTapHere:(id)sender;

@end
