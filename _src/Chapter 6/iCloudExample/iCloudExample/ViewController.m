//
//  ViewController.m
//  iCloudExample
//
//  Created by Steven F Daniel on 8/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize document;
@synthesize docQuery;
@synthesize docContents = m_docContents;
@synthesize btnSave     = m_btnSave;
@synthesize btnLoad     = m_btnLoad;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Do any additional setup after loading the view, typically from a nib.
	NSURL *ubiq = [[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil];
	if (!ubiq) {
		NSLog(@"iCloud not currently available");
		self.btnSave.enabled = NO;
		self.btnLoad.enabled = NO;
	}
	
	// Set the background color and font attributes for our note.
    UIFont * font = [UIFont fontWithName:@"Helvetica-Bold" size:[UIFont systemFontSize]];
    [self.docContents setFont:font];
    [self.docContents setBackgroundColor:[UIColor colorWithRed:1.0f green:1.0f blue:0.6f alpha:1.0f]];
		
    // Populate our TextView Control with the data for the selected record.
	[self btnLoad:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
	
    // Release any retained subviews of the main view.
    self.btnSave = nil;
    self.btnLoad = nil;
	
	// Turn off our notifications
	[docQuery disableUpdates];
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	// Add observer calls to monitor document and document state changes
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(documentChanged:)
												 name:UIDocumentStateChangedNotification object:self.document];
}

#pragma mark Saves the document to our iCloud repository
- (IBAction)btnSave:(UIBarButtonItem *)sender {
	
	// Point to our iCloud Documents container.
	NSURL *ubiq = [[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil];
	NSURL *ubiquitousPackage = [[ubiq URLByAppendingPathComponent:@"Documents"]
								URLByAppendingPathComponent:@"/Snippet.doc"];
    
    Snippet *doc = [[Snippet alloc] initWithFileURL:ubiquitousPackage];
    doc.docContent = self.docContents.text;

    // Check to see if we are editing a currently opened note
	[doc saveToURL:[doc fileURL] forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
		if (success) {
			NSLog(@"Document saved successfully");
		}
	}];
}

#pragma mark Reloads our document from cloud Storage
- (IBAction)btnLoad:(UIBarButtonItem *)sender {
	
	NSURL *ubiq = [[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil];
	if (ubiq)
	{
		docQuery = [[NSMetadataQuery alloc] init];
		[docQuery setSearchScopes:[NSArray arrayWithObject:NSMetadataQueryUbiquitousDocumentsScope]];
		NSPredicate *pred = [NSPredicate
							 predicateWithFormat: @"%K Like 'Snippet.doc'", NSMetadataItemFSNameKey];

		[docQuery setPredicate:pred];
				
		NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self selector:@selector(processQuery:)
					   name:NSMetadataQueryDidFinishGatheringNotification
					 object:docQuery];
		[center addObserver:self selector:@selector(processQuery:)
					   name:NSMetadataQueryDidUpdateNotification
					 object:docQuery];
		
		if (![self.docQuery isStarted]) [self.docQuery startQuery];
		[self.docQuery enableUpdates];
    }
	else {
		self.btnSave.enabled = NO;
		self.btnLoad.enabled = NO;
    }
}

#pragma mark Retrieve the contents of our document stored within iCloud and update our UITextView Control
- (void)processQuery:(NSNotification *)notification {
    
	[docQuery disableUpdates];
	
	if ([[docQuery results] count] == 1) {
		NSURL *url = [[[docQuery results] objectAtIndex:0] valueForAttribute:NSMetadataItemURLKey];
        Snippet *contents = [[Snippet alloc] initWithFileURL:url];
        [contents openWithCompletionHandler:^(BOOL success) {
            if (success) {
				[self.docContents setText:contents.docContent];
            }
        }];
	}
	[docQuery enableUpdates];
}

#pragma mark routine is called whenever a change to the document is encountered
- (void)documentChanged:(NSNotification *)notification {
		
	if ([notification.object documentState] & UIDocumentStateInConflict) {

		// Wait to find out what user wants first
		UIAlertView *alertView = [[UIAlertView alloc]
								   initWithTitle:@"Conflict Detected"
								   message:@"Document modified on another iOS device."
								   delegate:nil
								   cancelButtonTitle:nil
								   otherButtonTitles:@"OK", nil];
		[alertView show];
				
		// Point to our iCloud Documents container.
		NSURL *documentURL = [notification.object fileURL];
		NSArray *conflictVersions = [NSFileVersion
									 unresolvedConflictVersionsOfItemAtURL:documentURL];
		for (NSFileVersion *fileVersion in conflictVersions) {
			[fileVersion setResolved:YES];
		}
		[NSFileVersion removeOtherVersionsOfItemAtURL:documentURL error:nil];
		
		// Trigger an Auto-Save and re-enable our Query Updates
		[document updateChangeCount:UIDocumentChangeDone];
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
