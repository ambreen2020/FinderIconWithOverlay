//
//  AppDelegate.m
//  OverlayIcon
//
//  Created by Amber on 11/24/11.
//  Copyright (c) Amber2020. All rights reserved.
//

#import "AppDelegate.h"
#import "NSImage+Overlay.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    NSString *source = @"~/Documents/testicons/Donation.pdf";
    
    NSImage *overlayImage = [NSImage imageNamed:@"badge.png"];
        
    NSImage *composite = [NSImage quickLookImageOfFile:source withOverlayImage:overlayImage withIconSize:CGSizeMake(150.0, 150.0) overlayFrame:CGRectMake(15,10, 20, 20)];
    
    [[NSWorkspace sharedWorkspace] setIcon:composite forFile:source options:0];
    
    

}

@end
