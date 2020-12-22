//
//  Snippet.m
//  iCloudExample
//
//  Created by Steven Daniel on 08/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "Snippet.h"

@implementation Snippet

@synthesize docContent;

// Called whenever the application reads data from the file.
- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName error:(NSError **)outError
{
    // Initialize our document content
    self.docContent = @"";
    
    // Check to see if we have any text associated for the document.
    if ([contents length] > 0) {
        self.docContent = [[NSString alloc] initWithBytes:[contents bytes] 
                                                    length:[contents length] 
                                                  encoding:NSUTF8StringEncoding];
    }

    return YES;    
}

// Called whenever the application saves the content.
- (id)contentsForType:(NSString *)typeName error:(NSError **)outError 
{
    // Check to ensure we have content to save for our document.
    if ([self.docContent length] == 0) {
         self.docContent = @"";
    }

    // Save the document contents and return back the data.
    return [NSData dataWithBytes:[self.docContent UTF8String] 
                          length:[self.docContent length]];    
}

@end
