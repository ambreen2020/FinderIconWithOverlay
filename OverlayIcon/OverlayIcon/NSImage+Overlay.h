//
//  NSImage+Overlay.h
//  OverlayIcon
//
//  Created by Amber2010 on 11/24/11.
//  Copyright (c) 2011 Amber2010. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSImage (Overlay)

+ (NSImage *) quickLookImageOfFile:(NSString *) filePath withOverlayImage:(NSImage *) overlayImage withIconSize:(CGSize) size overlayFrame:(CGRect) frame;

@end
