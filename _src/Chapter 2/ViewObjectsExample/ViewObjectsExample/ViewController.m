//
//  ViewController.m
//  ViewObjectsExample
//
//  Created by Steven F Daniel on 15/09/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize subView;
@synthesize btnFadeIn;
@synthesize btnFadeOut;
@synthesize lblInfo;
@synthesize pgbProgress;
@synthesize imgPicture;
@synthesize txtTextInput;

float incrementBy = 0.0;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Do any additional setup after loading the view, typically from a nib.
	[self updateLabel];
	[self displayImage];
	[self populateTextBox];
	
	[self.pgbProgress setProgress:0.0 animated:YES];
	[self.btnFadeOut setEnabled:YES];
	[self.btnFadeIn setEnabled:NO];
}

- (void)viewDidUnload
{
	subView = nil;
    btnFadeIn = nil;
    [self setBtnFadeIn:nil];
    [self setBtnFadeOut:nil];
    btnFadeOut = nil;
	lblInfo = nil;
	[self setLblInfo:nil];
	pgbProgress = nil;
	[self setPgbProgress:nil];
	imgPicture = nil;
	[self setImgPicture:nil];
	txtTextInput = nil;
	[self setTxtTextInput:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)updateLabel
{
	lblInfo.text = @"Press button to change the background color";
	lblInfo.textColor = [UIColor blueColor];
	lblInfo.textAlignment = NSTextAlignmentLeft;
	lblInfo.adjustsFontSizeToFitWidth = TRUE;
	lblInfo.font = [UIFont fontWithName:@"Arial-Bold" size:17];
}

-(void)displayImage
{
	[self.imgPicture setImage:[UIImage imageNamed:@"Blue-Aqua-Apple.png"]];
	[self.imgPicture setContentMode:UIViewContentModeScaleAspectFit];
}

-(void)populateTextBox
{
	self.txtTextInput.text = @"This is some sample text";
	self.txtTextInput.keyboardAppearance = UIKeyboardAppearanceDefault;
	self.txtTextInput.keyboardType =  UIKeyboardTypeNumbersAndPunctuation;
	self.txtTextInput.returnKeyType = UIReturnKeyDone;
	self.txtTextInput.delegate = self;
}

- (IBAction)viewFadeOut:(UIBarButtonItem *)sender {

	[UIView beginAnimations: @"Fade Out" context:nil];
	[UIView setAnimationDuration:2.0];
	[self.subView setAlpha:0.0f];
	[UIView commitAnimations];
	
	[self.btnFadeOut setEnabled:NO];
	[self.btnFadeIn setEnabled:YES];
}
- (IBAction)viewFadeIn:(UIBarButtonItem *)sender {
	
	[UIView beginAnimations: @"Fade In" context:nil];
	[UIView setAnimationDuration:2.0];
	[self.subView setAlpha:1.0f];
	[UIView commitAnimations];

	// Disable our FadeIn Button since we are processing
	[self.btnFadeOut setEnabled:YES];
	[self.btnFadeIn  setEnabled:NO];
}

- (IBAction)btnTapHere:(UIButton *)sender {

	[self fillProgressBar];
	[self.lblInfo setBackgroundColor:[UIColor yellowColor]];
}

- (void)fillProgressBar {
	
	[self.pgbProgress setProgress:(incrementBy = 0.0f)];
	[self.pgbProgress setProgressViewStyle:UIProgressViewStyleBar];
	[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(incrementBar:) userInfo:nil repeats:YES];
}

-(void)incrementBar:(NSTimer *)timer
{
	incrementBy += 10.0f;
    [pgbProgress setProgress:(incrementBy / 100)];
	if (incrementBy > 100.0)
	{
		self.lblInfo.text = @"Processing has been Completed";
		[timer invalidate];
	}
	else
	{
		self.lblInfo.text = [NSString stringWithFormat:@"Processing data records: %3.2f", (pgbProgress.progress * 100)];
	}
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
        
    // Dismisses the keyboard when the "Done" button is clicked
    [textField resignFirstResponder];
    return YES;
}

-(void) textFieldDidBeginEditing:(UITextField *)textField
{
   lblInfo.text = @"TextField contents are being updated";
   [self.lblInfo setBackgroundColor:[UIColor redColor]];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
	lblInfo.text = @"TextField contents have now been updated.";
	[self.lblInfo setBackgroundColor:[UIColor greenColor]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
