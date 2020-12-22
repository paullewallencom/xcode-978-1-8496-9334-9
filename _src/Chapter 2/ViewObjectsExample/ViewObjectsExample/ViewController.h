//
//  ViewController.h
//  ViewObjectsExample
//
//  Created by Steven F Daniel on 15/09/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
{
	__weak IBOutlet UIView *subView;
	__weak IBOutlet UIBarButtonItem *btnFadeIn;
	__weak IBOutlet UIBarButtonItem *btnFadeOut;
	__weak IBOutlet UILabel *lblInfo;
	__weak IBOutlet UIButton *btnTapHere;
	__weak IBOutlet UIProgressView *pgbProgress;
	__weak IBOutlet UIImageView *imgPicture;
	__weak IBOutlet UITextField *txtTextInput;
}

@property (weak, nonatomic) IBOutlet UIView *subView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnFadeIn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnFadeOut;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;
@property (weak, nonatomic) IBOutlet UIButton *btnTapHere;
@property (weak, nonatomic) IBOutlet UIProgressView *pgbProgress;
@property (weak, nonatomic) IBOutlet UIImageView *imgPicture;
@property (weak, nonatomic) IBOutlet UITextField *txtTextInput;

- (IBAction)viewFadeOut:(UIBarButtonItem *)sender;
- (IBAction)viewFadeIn:(UIBarButtonItem *)sender;
- (IBAction)btnTapHere:(UIButton *)sender;

@end
